#!/usr/bin/python

ANSIBLE_METADATA = {
    "metadata_version": "1.1",
    "status": ["preview"],
    "supported_by": "community",
}

DOCUMENTATION = """
---
module: vscode_ext

short_description: manage vscode extentions

version_added: "2.4"

description:
    - Manages Visual Studio Code extensions

options:
    name:
        description:
            - name of extension to install/remove 
        required: true
    state:
        description:
            - state of package
        choices: ['latest', 'present', 'absent']
        required: false
        default: 'present'

author:
    - Brandon Bennett
"""

EXAMPLES = """
# Install vscode extension foo.bar
- vscode_ext:
    name: foo.bar
    state: present

# Install or upgrade extension foo.bar
- vscode_ext:
    name: foo.bar
    state: latest

# Remove vscode extension foo.bar
- vscode_ext:
    name: foo.var
    state: absent
"""

from ansible.module_utils.basic import AnsibleModule


class VSCodeException(Exception):
    pass


class VSCodeExt(object):
    def __init__(self, module):
        self.module = module

        self.code_path = self.module.get_bin_path(
            "code",
            required=True,
        )

    def _installed_extensions(self):
        cmd = [
            self.code_path,
            "--list-extensions",
            "--show-versions",
        ]
        rc, out, err = self.module.run_command(cmd)

        if rc != 0:
            raise VSCodeException(
                "failed to list installed extensions: {}".format(err.strip())
            )

        extensions = {}
        for line in out.splitlines():
            ext, ver = line.split("@")
            extensions[ext] = ver

        return extensions

    def _extension_installed_ver(self, ext):
        installed_exensions = self._installed_extensions()
        if ext in installed_exensions:
            return installed_exensions[ext]
        return None

    def install_extension(self, ext, upgrade=True):
        existing_ver = self._extension_installed_ver(ext)
        if existing_ver and not upgrade:
            return (
                False,
                "Extension is already installed: {} (current version: {})".format(
                    ext, existing_ver
                ),
            )

        if self.module.check_mode:
            return True, "Extension would be installed/upgraded: {}".format(ext)

        cmd = [
            self.code_path,
            "--install-extension",
            ext,
        ]

        if upgrade:
            cmd.append("--force")

        rc, out, err = self.module.run_command(cmd)
        if rc != 0:
            raise VSCodeException(
                "failed to install extension {}: {}".format(ext, err.strip())
            )

        if "is already installed" in out:
            return False, "Extension is already installed: {}".format(ext)

        return True, "Extention installed: {}".format(ext)

    def uninstall_extension(self, ext):
        existing_ver = self._extension_installed_ver(ext)
        if not existing_ver:
            return False, "Extension is not installed: {}".format(ext)

        if self.module.check_mode:
            return True, "Extension would be removed: {}".format(ext)

        cmd = [self.code_path, "--uninstall-extension", ext]

        rc, _, err = self.module.run_command(cmd)
        if rc != 0:
            raise VSCodeException(
                "failed to uninstall extension {}: {}".format(ext, err.strip())
            )

        return True, "Exension removed: {}".format(ext)

    def run(self, ext, state):
        if state == "present":
            return self.install_extension(ext)
        elif state == "latest":
            return self.install_extension(ext, upgrade=True)
        elif state == "absent":
            return self.uninstall_extension(ext)
        raise Exception("unknown state value '{}".format(state))


def main():
    module = AnsibleModule(
        argument_spec=dict(
            name=dict(type="str", required=True),
            state=dict(type="str", choices=["present", "latest", "absent"]),
        ),
        supports_check_mode=True,
    )

    ext_name = module.params["name"]
    state = module.params.get("state", "present")

    try:
        vscode = VSCodeExt(module=module)
        (changed, message) = vscode.run(ext_name, state)
        module.exit_json(changed=changed, msg=message)
    except VSCodeException as e:
        module.fail_json(msg=str(e))


if __name__ == "__main__":
    main()

# personal Ansible playbooks

This is a colleciton of playbooks that I use to maintain my laptops, desktops, and servers and is a replacement for a simple [Homesick](https://github.com/technicalpickles/homesick)/[Heartsick](https://github.com/nemith/heartsick) dotfiles repository. Moving to Ansible was really a way to learn ansible, but it also allows for a lot more customization, installing packages, etc.

These playbooks are intended to be ran either via [`ansible-pull`](https://docs.ansible.com/ansible/latest/cli/ansible-pull.html) or a custom script `bin\ansible-local` which is a simple wrapper around [`ansible-playbook`](https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html) that emulates the options of `ansible-pull` without the VCS options. This allows a simple command to kick off the proper playbooks for the given host machine.

e.g will default to the `local.yml' playbook and prompt for the become/sudo password. It will only run playbooks for the localhost, local hostname or fqdn:

```
./bin/ansible-local -K
```

which is equivelent to

```
ansibple-playbook -c local --limit "localhost,$(hostname -s),$(hostname),127.0.0.1" -K local.yml
```

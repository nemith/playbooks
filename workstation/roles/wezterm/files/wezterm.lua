local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({
    "Fira Code",
    "Noto Color Emoji",
    "JetBrains Mono",
    "Last Resort High-Efficiency",    
  }),
  font_size = 10.0,
  hyperlink_rules = {
    {
      regex = "\\b[tT](\\d+)\\b",
      format = "https://www.internalfb.com/tasks/?t=$1",
    },
    {
      regex = "\\b[dD]\\d+\\b",
      format = "https://www.internalfb.com/diff/$0",
    },
  },
  ssh_domains = {
    {
      name = "coachz",
      remote_address = "coachz.brbe.net",
      username = "bbennett",
    },
  },
}

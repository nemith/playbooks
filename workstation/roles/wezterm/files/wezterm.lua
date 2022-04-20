local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({
    "Fira Code",
    "Noto Color Emoji",
    "JetBrains Mono",
    "Last Resort High-Efficiency",    
  }),
  font_size = 11.0,
}

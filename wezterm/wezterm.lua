local wezterm = require 'wezterm';
return {
    enable_wayland = true,
    font = wezterm.font({
        family = "Fira Code",
        harfbuzz_features = {"ss05", "ss03"}
    }),
    font_size = 11,
    hide_tab_bar_if_only_one_tab = true,
    -- color_scheme = "Ollie"
    -- color_scheme = "Rippedcasts"
    color_scheme = "Thayer Bright"
}

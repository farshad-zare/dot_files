local wezterm = require 'wezterm';
return {
    enable_wayland = true,
    font = wezterm.font({
        family = "Fira Code",
        harfbuzz_features = {"ss05", "ss03"}
    }),
    font_size = 11,
    initial_rows = 25,
    initial_cols = 130,
    term = 'wezterm',
    window_decorations = "TITLE | RESIZE",
    hide_tab_bar_if_only_one_tab = false,
    -- color_scheme = "Ollie"
    -- color_scheme = "Rippedcasts"
    color_scheme = "Thayer Bright"
}

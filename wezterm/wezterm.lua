local wezterm = require 'wezterm';
return {
    font = wezterm.font({
        family = "Fira Code",
        harfbuzz_features = {"ss05", "ss03"}
    }),
    -- font = wezterm.font({
    --     family = "juliaMono",
    --     harfbuzz_features = {"ss14", "ss12", }
    -- }),
    font_size = 11,
    hide_tab_bar_if_only_one_tab = true,
    color_scheme = "MaterialDarker"
    -- color_scheme = "Ollie"
    -- color_scheme = "Rippedcasts"
    -- color_scheme = "Thayer Bright"
    -- color_scheme = "Wombat"
}

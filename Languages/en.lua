-- Every variable must start with this addon's unique ID, as each is a global.
local localization_strings = {
    SI_EOL_MESSAGE_P  = " player is loaded",
    SI_EOL_MESSAGE_A = " addon is loaded",
    -- Keybindings.
    EchoesOfLore_EOL_DISPLAY  = "Display EchoesOfLore",
}

for stringId, stringValue in pairs(localization_strings) do
   ZO_CreateStringId(stringId, stringValue)
   SafeAddVersion(stringId, 1)
end
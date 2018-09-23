EchoesOfLore = {
    name            = "EchoesOfLore",	-- Matches folder and Manifest file names.
    displayName     = "Elder Scrolls of Alts",
    version         = "0.0.1",			-- A nuisance to match to the Manifest.
    author          = "Echomap",
    color           = "DDFFEE",			 -- Used in menu titles and so on.    
    menuName        = "EchoesOfLore_Options", -- Unique identifier for menu object.
    menuDisplayName = "EchoesOfLore",
    view            = {},
    -- Saved Settings
    savedVariables  = {},
}

--ZO_SORT_ORDER_UP, --ZO_SORT_ORDER_DOWN
local defaultSettings = {   
  sversion   = EchoesOfLore.version,
  window     = {
      ["top"]       = 100,
      ["left"]      = 100,
      ["width"]     = 830,
      ["height"]    = 325,
  },
  selected = {
    ["charactername"] = nil,
  },
}

local defaultSettingsGlobal = {
  debug      = false,
  beta       = false,
}

--Commands, help/debug/beta/testdata/deltestdata
function EchoesOfLore.SlashCommandHandler(text)
	EchoesOfLore.debugMsg("SlashCommandHandler: " .. text)
	local options = {}
	local searchResult = { string.match(text,"^(%S*)%s*(.-)$") }
	for i,v in pairs(searchResult) do
		if (v ~= nil and v ~= "") then
		    options[i] = string.lower(v)
		end
	end

	if #options == 0 then
    EchoesOfLore.ToggleGui()
	elseif options[1] == "help" then
		-- TODO Display help  
	elseif options[1] == "debug" then
		local dg = EchoesOfLore.savedVariables.debug
		EchoesOfLore.savedVariables.debug = not dg
		d("EchoesOfLore: Debug = " .. tostring(EchoesOfLore.savedVariables.debug) )    
	elseif options[1] == "beta" then
		local dg = EchoesOfLore.savedVariables.beta
		EchoesOfLore.savedVariables.beta = not dg
		d("EchoesOfLore: Beta = " .. tostring(EchoesOfLore.savedVariables.beta) )
  elseif options[1] == "testdata" then
    --EchoesOfLore:LoadTestData1()
  elseif options[1] == "deltestdata" then
    --EchoesOfLore:DelTestData1()    
	end
end

-- EVENT
function EchoesOfLore.Activated(e)
    EVENT_MANAGER:UnregisterForEvent(EchoesOfLore.name, EVENT_PLAYER_ACTIVATED)
    EchoesOfLore:debugMsg(EchoesOfLore.name .. GetString(SI_EOL_MESSAGE_P)) 
    ZO_AlertNoSuppression(UI_ALERT_CATEGORY_ALERT, nil,
        EchoesOfLore.name .. GetString(SI_EOL_MESSAGE_P)) -- Top-right alert.

    EchoesOfLore:Initialize()
    --EchoesOfLore:RestoreUI()
    --CHAMPION_PERKS_SCENE:RegisterCallback('StateChange',EchoesOfLore.OnChampionPerksSceneStateChange)
end

-- When player is ready, after everything has been loaded. (after addon loaded)
EVENT_MANAGER:RegisterForEvent(EchoesOfLore.name, EVENT_PLAYER_ACTIVATED, EchoesOfLore.Activated)

-- EVENT
-- TODO When is this called? NOT On quit!!
function EchoesOfLore.OnAddOnUnloaded(event)
  EchoesOfLore.debugMsg("OnAddOnUnloaded called") -- Prints to chat.  
  --EchoesOfLore.loadPlayerData()
  --EchoesOfLore.SaveSettings()
  EchoesOfLore.debugMsg("OnAddOnUnloaded done") -- Prints to chat.
end

-- EVENT
function EchoesOfLore.OnAddOnLoaded(event, addonName)
    if addonName ~= EchoesOfLore.name then return end
    EVENT_MANAGER:UnregisterForEvent(EchoesOfLore.name, EVENT_ADD_ON_LOADED)
  --
    EchoesOfLore.savedVariables = ZO_SavedVars:New("EchoesOfLore_SavedVariables", 1, nil, defaultSettings)

    -- LMM Settings menu in Settings.lua.
    EchoesOfLore.LoadSettings()    

    -- Slash commands must be lowercase. Set to nil to disable.
    SLASH_COMMANDS["/EchoesOfLore"] = EchoesOfLore.SlashCommandHandler
    SLASH_COMMANDS["/echolore"]     = EchoesOfLore.SlashCommandHandler
    -- Reset autocomplete cache to update it.
    SLASH_COMMAND_AUTO_COMPLETE:InvalidateSlashCommandCache()
    
    --d(EchoesOfLore.name .. GetString(SI_NEW_ADDON_MESSAGE2)) -- Prints to chat.
    ZO_AlertNoSuppression(UI_ALERT_CATEGORY_ALERT, nil,
        EchoesOfLore.name .. GetString(SI_EOL_MESSAGE_A)) -- Top-right alert.
end

--SCENE_MANAGER:RegisterTopLevel(HarvensQuestJournalTopLevel, false)

-- When any addon is loaded, but before UI (Chat) is loaded.
EVENT_MANAGER:RegisterForEvent(EchoesOfLore.name, EVENT_ADD_ON_LOADED, EchoesOfLore.OnAddOnLoaded)
--
EVENT_MANAGER:RegisterForEvent(EchoesOfLore.name, EVENT_PLAYER_DEACTIVATED, EchoesOfLore.OnAddOnUnloaded)

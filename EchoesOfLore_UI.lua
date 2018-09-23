----------------
-- EchosOfLore--
----------------

--Called when addon Activated
function EchoesOfLore.Initialize()
  EchoesOfLore:InitializeData()
--[[
	local fragment = ZO_FadeSceneFragment:New(HarvensQuestJournalTopLevel)
	
	local scene = ZO_Scene:New("HarvensQuestJournal", SCENE_MANAGER)
	if FRAGMENT_GROUP.UI_WINDOW then
		scene:AddFragmentGroup(FRAGMENT_GROUP.UI_WINDOW)
	else
		scene:AddFragmentGroup(FRAGMENT_GROUP.MOUSE_DRIVEN_UI_WINDOW)
	end
	scene:AddFragment(fragment)
	scene:AddFragment(UNIFORM_BLUR_FRAGMENT)
	
	--EchoesOfLore:InitKeybindStripDescriptor()
  --
	--EchoesOfLore:InitJournal(HarvensQuestJournalTopLevel)
  ]]--
end

--
function EchoesOfLore.ToggleGui()
  --SCENE_MANAGER:ToggleTopLevel(HarvensQuestJournalTopLevel)
  if( EchoesOfLoreMain:IsHidden()) then
    EchoesOfLoreMain:SetHidden(false)
  else
    EchoesOfLoreMain:SetHidden(true)
  end
  
  --[[
  if not SCENE_MANAGER:IsShowing("HarvensQuestJournal") then
		SCENE_MANAGER:ShowTopLevel("HarvensQuestJournal")
	else
		SCENE_MANAGER:HideTopLevel("HarvensQuestJournal")
	end
  --]]
end

--
function EchoesOfLore:onMoveStop()
  --EchoesOfLoreMain:SetTop(  EchoesOfLoreMain_Bg:GetTop()  )
  --EchoesOfLoreMain:SetLeft( EchoesOfLoreMain_Bg:GetLeft() )
end

--
function EchoesOfLore:CloseUI(self)
  EchoesOfLoreMain:SetHidden(true)
end

--
function EchoesOfLore:ShowView(self,viewName)
  EchoesOfLore:debugMsg("ShowView Called!")  
  EchoesOfLoreMain_TopSubRowDungeon:SetHidden(true)
  EchoesOfLore.view.viewName = viewName
  if(viewName==nil) then
    EchoesOfLore:clearView()    
  elseif(viewName=="Dungeons")then
    EchoesOfLore:showViewDungeon()
  elseif(viewName=="Area")then
    EchoesOfLore:showViewArea()
  end
end

--
function EchoesOfLore:clearView()
  EchoesOfLoreMain_LeftPage_Edit:SetText("")
end

--
function EchoesOfLore:showViewDungeon()
  EchoesOfLoreMain_TopSubRowDungeon:SetHidden(false)
  EchoesOfLoreMain_LeftPage_Edit:SetText("Dungeons\n123\n1234\n12345\n123456")
    --EchoesOfLoreMain_Sidebar_BtnTop2

  --EchoesOfLoreMain_TopSubRowDungeon_DropdownDName
  EchoesOfLoreMain_TopSubRowDungeon_DropdownDName.comboBox = EchoesOfLoreMain_TopSubRowDungeon_DropdownDName.comboBox or ZO_ComboBox_ObjectFromContainer(EchoesOfLoreMain_TopSubRowDungeon_DropdownDName)
  local comboBox = EchoesOfLoreMain_TopSubRowDungeon_DropdownDName.comboBox
  comboBox:ClearItems()
  comboBox:SetSortsItems(false)
  local function OnItemSelect1(_, choiceText, choice)
    EchoesOfLore:debugMsg(" choiceText=" .. choiceText .. " choice=" .. tostring(choice) )  
    --ElderScrollsOfAlts:doCharacterSelected(choiceText, choice) --getQualityDict()[choiceText])
    EchoesOfLore:showViewDungeon2(choiceText)
    EchoesOfLore.view.dungeonselected = choiceText
    PlaySound(SOUNDS.POSITIVE_CLICK)    
  end
  local validChoices = {} -- ElderScrollsOfAlts:ListOfCategories(true)
  table.insert(validChoices, "None")
  for k, v in pairs(EchoesOfLore.Dungeons) do
    if k ~= nil then
      --d("List: players " .. k)
      table.insert(validChoices, k)
    end
  end
  --[[
  table.insert(validChoices, "Arx Corinium")
  table.insert(validChoices, "Blackheart Haven")
  
  table.insert(validChoices, "Spindleclutch 1")
  table.insert(validChoices, "Spindleclutch 2")
      
  table.insert(validChoices, "Wayreset Sewers 1")
  table.insert(validChoices, "Wayreset Sewers 2")
  table.insert(validChoices, "White-Gold Tower")
  --]]
  for i = 1, #validChoices do
    local entry = comboBox:CreateItemEntry(validChoices[i], OnItemSelect1)
    comboBox:AddItem(entry)
  end
  comboBox:SelectFirstItem()
  
  --
  EchoesOfLore:showViewDungeon2()
end

function EchoesOfLore:showViewDungeon2(varselected)
  EchoesOfLore:debugMsg("showViewDungeon2= varselected=" .. tostring(varselected) )  
  --EchoesOfLoreMain_TopSubRowDungeon_DropdownDBoss
  EchoesOfLoreMain_TopSubRowDungeon_DropdownDBoss.comboBox = EchoesOfLoreMain_TopSubRowDungeon_DropdownDBoss.comboBox or ZO_ComboBox_ObjectFromContainer(EchoesOfLoreMain_TopSubRowDungeon_DropdownDBoss)
  local comboBox = EchoesOfLoreMain_TopSubRowDungeon_DropdownDBoss.comboBox
  comboBox:ClearItems()
  comboBox:SetSortsItems(false)
  local function OnItemSelect(_, choiceText, choice)
    EchoesOfLore:debugMsg(" choiceText=" .. choiceText .. " choice=" .. tostring(choice) )  
    --ElderScrollsOfAlts:doCharacterSelected(choiceText, choice) --getQualityDict()[choiceText])
    EchoesOfLore.view.bossselected = choiceText
    EchoesOfLore:showDungeonText()
    PlaySound(SOUNDS.POSITIVE_CLICK)    
  end
  local validChoices = {} --ElderScrollsOfAlts:ListOfCategories(true)  
  table.insert(validChoices, "Overall")
  if(varselected~=nil)then
    if(EchoesOfLore.Dungeons[varselected]~=nil and EchoesOfLore.Dungeons[varselected].bosses~=nil)then
      for k, v in pairs(EchoesOfLore.Dungeons[varselected].bosses) do
        if k ~= nil then
          --d("List: players " .. k)
          table.insert(validChoices, k)
        end
      end
    end
  end
  
  --[[table.insert(validChoices, "Map")
  table.insert(validChoices, "Spindlekin")
  table.insert(validChoices, "Swarm Mother")
  --]]

  for i = 1, #validChoices do
    local entry = comboBox:CreateItemEntry(validChoices[i], OnItemSelect)
    comboBox:AddItem(entry)
  end
  comboBox:SelectFirstItem()
  --if(varselected~=nil)then
  --  comboBox2:SetSelectedItem(varselected)  
  --end
end

--
function EchoesOfLore:showViewArea()
    EchoesOfLoreMain_LeftPage_Edit:SetText("AREA asdf adsf sdfadsf sdfafaf   asfa adsf sdf df f asdf adsf sdfadsf sdfafaf   asfa adsf sdf df f asdf adsf sdfadsf sdfafaf   asfa adsf sdf df f asdf adsf sdfadsf sdfafaf   asfa adsf sdf df f")  
end

--
function EchoesOfLore:showDungeonText()
  local sText = ""
  local dungeon = EchoesOfLore.view.dungeonselected
  EchoesOfLore:debugMsg("showDungeonText dungeon=" .. tostring(dungeon) )  
  if(dungeon~=nil)then
    local boss = EchoesOfLore.view.bossselected
    EchoesOfLore:debugMsg("showDungeonText boss=" .. tostring(boss) )  
    if(EchoesOfLore.Dungeons[dungeon]~=nil and EchoesOfLore.Dungeons[dungeon].bosses~=nil)then
      if(EchoesOfLore.Dungeons[dungeon].bosses[boss]~=nil)then
        sText = EchoesOfLore.Dungeons[dungeon].bosses[boss].text
        EchoesOfLore:debugMsg("showDungeonText set sText")
      end
    end
  end
   EchoesOfLoreMain_LeftPage_Edit:SetText(sText)  
end

--
EchoesOfLore.Dungeons = {}

function EchoesOfLore:InitializeData()
  EchoesOfLore.Dungeons = {
      ["Arx Corinium"]      = {} ,
      ["Blackheart Haven"]  = {} ,
      ["Spindleclutch 1"]   = {} ,
      ["Spindleclutch 2"]   = {} ,
      ["Wayreset Sewers 1"] = {} ,
      ["Wayreset Sewers 2"] = {} ,
      ["White-Gold Tower"]  = {} ,
  }
  
  EchoesOfLore.Dungeons["Arx Corinium"].bosses = {}
  EchoesOfLore.Dungeons["Spindleclutch 1"].bosses = {}
  
  EchoesOfLore.Dungeons["Spindleclutch 1"].bosses = {
     ["Spindlekin"]   = {
        text = "Spindlekin is a boss...",
      } ,
     ["Swarm Mother"] = {
      } ,
  }
  
  --ElderScrollsOfAlts.Sunk_Tooltip["Jewelry"] = {
    --[0] = "Allows the use of |c00FFFFPewter|r Ounces.",
end


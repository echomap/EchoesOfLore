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
  comboBox:SetSortsItems(true)
  local function OnItemSelect1(_, choiceText, choice)
    EchoesOfLore:debugMsg(" choiceText=" .. choiceText .. " choice=" .. tostring(choice) )  
    --ElderScrollsOfAlts:doCharacterSelected(choiceText, choice) --getQualityDict()[choiceText])
    EchoesOfLore:showViewDungeon2(choiceText)
    EchoesOfLore.view.dungeonselected = choiceText
    PlaySound(SOUNDS.POSITIVE_CLICK)    
  end
  local validChoices = {} -- ElderScrollsOfAlts:ListOfCategories(true)
  --local nonElem = {}
  --nonElem.name = "None"  
  table.insert(validChoices, "_None"  )
  for k, v in pairs(EchoesOfLore.Dungeons) do
    if k ~= nil then
      --d("List: players " .. k)
      table.insert(validChoices, k)
    end
  end
  if(validChoices~=nil)then
    local validChoicesS = validChoices
    --table.sort( validChoices, EchoesOfLore.SortDungeonData )   
    for i = 1, #validChoicesS do
      local entry = comboBox:CreateItemEntry(validChoicesS[i], OnItemSelect1)
      comboBox:AddItem(entry)
    end
  end
  comboBox:SelectFirstItem()
  
  --
  EchoesOfLore:showViewDungeon2()
end

function EchoesOfLore:showViewDungeon2(dungeon)
  EchoesOfLore:debugMsg("showViewDungeon2= dungeon=" .. tostring(dungeon) )  
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
  --local nonElem = {}
  --nonElem.name = "Overall"    
  table.insert(validChoices, "Overall")
  if(dungeon~=nil)then
    if(EchoesOfLore.Dungeons[dungeon]~=nil and EchoesOfLore.Dungeons[dungeon].bosses~=nil)then
      for k, v in pairs(EchoesOfLore.Dungeons[dungeon].bosses) do
        if k ~= nil then
          --d("List: players " .. k)
          table.insert(validChoices, k)
        end
      end
    end
  end

  for i = 1, #validChoices do
    local entry = comboBox:CreateItemEntry(validChoices[i], OnItemSelect)
    comboBox:AddItem(entry)
  end
  comboBox:SelectFirstItem()
  --if(varselected~=nil)then
  --  comboBox2:SetSelectedItem(varselected)  
  --end
  
  --
  local sText = ""
  if(EchoesOfLore.Dungeons[dungeon]~=nil and EchoesOfLore.Dungeons[dungeon].text~=nil)then
    sText = EchoesOfLore.Dungeons[dungeon].text
    EchoesOfLore:debugMsg("showDungeonText set sText")    
  end
  EchoesOfLoreMain_LeftPage_Edit:SetText(sText)  
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
    if(EchoesOfLore.Dungeons[dungeon]==nil)then
      --
    elseif(boss=="Overall")then
      if(EchoesOfLore.Dungeons[dungeon].text~=nil)then
        sText = EchoesOfLore.Dungeons[dungeon].text
      end
    elseif(EchoesOfLore.Dungeons[dungeon]~=nil) then
      sText = EchoesOfLore:combineText(
              EchoesOfLore.Dungeons[dungeon].bosses[boss].text,
              EchoesOfLore.Dungeons[dungeon].bosses[boss].mechanics,
              EchoesOfLore.Dungeons[dungeon].bosses[boss].strategy,
              EchoesOfLore.Dungeons[dungeon].bosses[boss].strattanks,
              EchoesOfLore.Dungeons[dungeon].bosses[boss].stratdps,
              EchoesOfLore.Dungeons[dungeon].bosses[boss].stratheals )
        EchoesOfLore:debugMsg("showDungeonText set sText")
    end
  end--dungeon
   EchoesOfLoreMain_LeftPage_Edit:SetText(sText)  
end

function EchoesOfLore:combineText(var1,var2,var3,var4,var5,var6)
    if(var1==nil)then
      var1 = ""
    end
    if(var2==nil)then
      var2 = ""
    end
    if(var3==nil)then
      var3 = ""
    end
    if(var4==nil)then
      var4 = ""
    end
    if(var5==nil)then
      var5 = ""
    end
    if(var6==nil)then
      var6 = ""
    end
    local sText = string.format("%s\n%s\n%s\n%s\n%s\n%s\n",
              var1,var2,var3,var4,var5,var6)
    return sText
end

----------------
-- EchosOfLore--
----------------


--Called when addon Activated
function EchoesOfLore.Initialize()
  EchoesOfLore:InitializeData()
  --local EM, WM, SM, ICON, MARK, AVAIL_EQUIPMENT_CACHE = EVENT_MANAGER, WINDOW_MANAGER, SCENE_MANAGER, {}, {}, nil
  EchoesOfLore.WM = WINDOW_MANAGER
end

--
function EchoesOfLore.ToggleGui()
  if( EchoesOfLoreMain:IsHidden()) then
    EchoesOfLoreMain:SetHidden(false)
  else
    EchoesOfLoreMain:SetHidden(true)
  end
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
  EchoesOfLoreMain_SideContainer:SetHidden(true)
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
  --EchoesOfLore:setTextArea("")
end

--
function EchoesOfLore:showViewDungeon()
  EchoesOfLoreMain_TopSubRowDungeon:SetHidden(false)
  EchoesOfLoreMain_SideContainer:SetHidden(false)
  --EchoesOfLore:setTextArea("Dungeons\n123\n1234\n12345\n123456")
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
    validChoicesS = table.sort( validChoices,  EchoesOfLore.SortDungeonData )   
    if(validChoicesS==nil)then
      validChoicesS = validChoices
      d("EchoesOfLore: bad sort (Dungeon)!")
      --table.sort( validChoices, EchoesOfLore.SortDungeonData )   
    end
    for i = 1, #validChoicesS do
      local entry = comboBox:CreateItemEntry(validChoicesS[i], OnItemSelect1)
      comboBox:AddItem(entry)
    end
  end
  comboBox:SelectFirstItem()
  
  --
  EchoesOfLore:showViewDungeon2()
end

--SHOW/Setup dropdowns
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
  
  local dataLines2   = table.sort( validChoices,  EchoesOfLore.SortBossesData )
  if(dataLines2==nil) then
    dataLines2 = validChoices
    d("EchoesOfLore: bad sort (Bosses)!")
  end

  for i = 1, #dataLines2 do
    local entry = comboBox:CreateItemEntry(dataLines2[i], OnItemSelect)
    comboBox:AddItem(entry)
  end
  comboBox:SelectFirstItem()
  
  --
  local sText = ""
  if(EchoesOfLore.Dungeons[dungeon]~=nil and EchoesOfLore.Dungeons[dungeon].text~=nil)then
    sText = EchoesOfLore.Dungeons[dungeon].text
    EchoesOfLore:debugMsg("showViewDungeon2 set sText")    
  end
  --EchoesOfLore:setTextArea(sText)
end

--
function EchoesOfLore:showViewArea()
    --EchoesOfLore:setTextArea("AREA asdf adsf sdfadsf sdfafaf   asfa adsf sdf df f asdf adsf sdfadsf sdfafaf   asfa adsf sdf df f asdf adsf sdfadsf sdfafaf   asfa adsf sdf df f asdf adsf sdfadsf sdfafaf   asfa adsf sdf df f")  
end

--SHOW/setup Text based on boss selected
function EchoesOfLore:showDungeonText()
  local sText = ""
  local dungeon = EchoesOfLore.view.dungeonselected
  EchoesOfLore:debugMsg("showDungeonText dungeon=" .. tostring(dungeon) )  
  if(dungeon==nil)then
    EchoesOfLore:debugMsg("showDungeonText dungeon is nil!")
    return
  end
  local dungeonData = EchoesOfLore.Dungeons[dungeon]
  if(dungeonData==nil)then  
    EchoesOfLore:debugMsg("showDungeonText dungeonData is nil!")
    return
  end
  
  local boss = EchoesOfLore.view.bossselected
  if(boss==nil)then
    EchoesOfLore:debugMsg("showDungeonText boss is nil!")
    return
  end  
  EchoesOfLore:debugMsg("showDungeonText boss=" .. tostring(boss) )  
  local bossesData = EchoesOfLore.Dungeons[dungeon].bosses
  if(bossesData==nil)then
    EchoesOfLore:debugMsg("showDungeonText bossesData is nil!")
    return
  end  
  local bossData = EchoesOfLore.Dungeons[dungeon].bosses[boss]
  if(bossData==nil)then
    EchoesOfLore:debugMsg("showDungeonText bossData is nil!")
    return
  end
  
  --clear buttons
  if(EchoesOfLore.view.buttons~=nil)then
    for index, value in ipairs(EchoesOfLore.view.buttons) do
      value:SetHidden(true)
    end
  end
  
  local nr = 1
  local textList = bossData.text
  if(textList==nil)then
    --TODO clear data
    return
  end
  local dataLines2   = table.sort( textList,  EchoesOfLore.SortButtonData )
  if(dataLines2==nil)then
    --TODO clear data
    dataLines2 = textList
    d("EchoesOfLore: Bad sort (Buttons)!")
  end
  EchoesOfLore.view.buttons = {}
  for key,value in pairs(dataLines2) do
    --EchoesOfLore:debugMsg("key="..tostring(key) .. " value="..tostring(value))
    --EchoesOfLoreMain_SideContainer:SetHidden(false)
    --local p = WM:CreateControl(name, parent, CT_BUTTON) 
    local s = EchoesOfLoreMain_SideContainer:GetNamedChild('_SetBtn_'..nr)
    if(s==nil)then
      s = EchoesOfLore.WM:CreateControl('EchoesOfLoreMain_SideContainer_SetBtn_'..nr, EchoesOfLoreMain_SideContainer, CT_BUTTON)
    end
    if(s==nil)then
      d("EchoesOfLore: Failed to create button!")
      return
    end
    s:ClearAnchors()
    s:SetAnchor(TOPLEFT, EchoesOfLoreMain_SideContainer, TOPLEFT,0, (35*(nr-1)) )
    s:SetDimensions(150,30)
    s:SetFont("ZoFontGame")
    --s:SetFont("ZoFontWinH5")
    --nosuch? s:SetColor(0.8, 0.8, 0.8, 1)
    --s:SetWrapMode(TEXT_MODE_CLAMP)
    s:SetDrawLayer(1)
    --
    s:SetClickSound('Click')
    s:SetMouseOverTexture('EsoUI/Art/ActionBar/actionBar_mouseOver.dds')
    s:SetNormalTexture('EsoUI/Art/ActionBar/abilityFrame64_up.dds')
    s:SetPressedMouseOverTexture('EsoUI/Art/ActionBar/abilityFrame64_down.dds')
    s:SetHandler('OnClicked',function(self)
        --Use Text of button and selected dungeon and boss to get longtext
        EchoesOfLore:SelectBossText(self)
    end)
    --
    --s:SetHeight(20)
    --s:SetWidth(100)
    --s:SetAlpha(0)
    --font="ZoFontGameLargeBold" 
    s.ButtonName = key
    s.name = key    
    s:SetText(key)
    s:SetHidden(false)
    EchoesOfLore.view.buttons[nr] = s
    nr = nr + 1
  end

end

function EchoesOfLore:SelectBossText(self)
  --Use Text of button and selected dungeon and boss to get longtext
  if(self==nil)then
    d("Button method has self as nil?")
    return
  end
  
  local bText = self.ButtonName
  EchoesOfLore:debugMsg("SelectBossText bText=" .. tostring(bText) )  
  local sText = ""
  local dungeon = EchoesOfLore.view.dungeonselected
  EchoesOfLore:debugMsg("SelectBossText dungeon=" .. tostring(dungeon) )  
  if(dungeon==nil)then
    EchoesOfLore:debugMsg("SelectBossText dungeon is nil!")
    return
  end
  local dungeonData = EchoesOfLore.Dungeons[dungeon]
  if(dungeonData==nil)then  
    EchoesOfLore:debugMsg("SelectBossText dungeonData is nil!")
    return
  end
  
  local boss = EchoesOfLore.view.bossselected
  if(boss==nil)then
    EchoesOfLore:debugMsg("SelectBossText boss is nil!")
    return
  end  
  EchoesOfLore:debugMsg("SelectBossText boss=" .. tostring(boss) )  
  local bossesData = EchoesOfLore.Dungeons[dungeon].bosses
  if(bossesData==nil)then
    EchoesOfLore:debugMsg("SelectBossText bossesData is nil!")
    return
  end  
  local bossData = EchoesOfLore.Dungeons[dungeon].bosses[boss]
  if(bossData==nil)then
    EchoesOfLore:debugMsg("SelectBossText bossData is nil!")
    return
  end
  local textData = EchoesOfLore.Dungeons[dungeon].bosses[boss].text[bText]
  if(textData==nil)then
    EchoesOfLore:debugMsg("SelectBossText textData is nil!")
    return
  end
  EchoesOfLore:GetOrCreateTextBox(textData)
  --EchoesOfLore:ShowTextBox(textData)  
end

function EchoesOfLore:GetOrCreateTextBox(textData)
  EchoesOfLore:debugMsg("GetOrCreateTextBox textData=" .. tostring(textData) )  
  
  --Text Area
  local s = EchoesOfLoreMain_TextContainer_TextArea
  --[[
  local s = EchoesOfLoreMain_SideContainer:GetNamedChild('_TextArea_')
  if(s==nil)then
    s = EchoesOfLore.WM:CreateControl('EchoesOfLoreMain_SideContainer_TextArea_', EchoesOfLoreMain, CT_LABEL)
  end
  if(s==nil)then
    d("EchoesOfLore: Failed to create TextArea!")
  return
  end
  s:ClearAnchors()
  s:SetAnchor(TOPLEFT, EchoesOfLoreMain, TOPLEFT, 0, 60 )
  s:SetAnchor(BOTTOMRIGHT, EchoesOfLoreMain, BOTTOMRIGHT, 0, 0 )
  s:SetDimensions(400,300)
  --<Edge edgeSize="1"/>  
  s:SetDrawTier(1)
  s:SetHorizontalAlignment(TEXT_ALIGN_LEFT)
  s:SetVerticalAlignment(1)
  s:SetFont('ZoFontGame')
  s:SetColor(1,1,1,0.8)
  s:SetAlpha(0.8)
  s:SetHidden(false)
  --s:SetTexture('EsoUI/Art/LoreLibrary/lorelibrary_scroll.dds')
  ]]--
  if( textData == nil ) then
    s:SetText("")
  elseif( type(textData)=="table")then
    s:SetText(textData.text)
  elseif( type(textData)=="string")then
    s:SetText(textData)
  end
  s:SetHidden(false)
  
  -- Text Container
  local sa = EchoesOfLoreMain_TextContainer
  sa:SetHidden(false)
  --
  return s
end

    --[[
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

  --end--dungeon
  --
  --EchoesOfLore:setTextArea(sText)  
  --
  --TODO
  --
end
--]]
    
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



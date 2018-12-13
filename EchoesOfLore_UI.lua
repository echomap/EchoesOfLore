----------------
-- EchosOfLore--
----------------


--Called when addon Activated
function EchoesOfLore.InitializeUI()
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

function EchoesOfLore:DoPrintText()
  if ( EchoesOfLore.view.textData ~= nil) then
    if(EchoesOfLore.view.textData.text~-nil) then
      d(EchoesOfLore.view.textData.text)--TODO to channel?
    else
      d(EchoesOfLore.view.textData)
    end
    --
    --
    --
  end
end


--
function EchoesOfLore:ShowView(self,viewName)
  EchoesOfLore:debugMsg("ShowView Called!")  
  EchoesOfLoreMain_TopSubRowDungeon:SetHidden(true)
  EchoesOfLoreMain_TopSubRowArea:SetHidden(true)
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
  EchoesOfLore:GetOrCreateTextBox("")
  --clear buttons
  if(EchoesOfLore.view.buttons~=nil)then
    for index, value in ipairs(EchoesOfLore.view.buttons) do
      value:SetHidden(true)
    end
  end
end

-- Create Dungeon List/dropdown
function EchoesOfLore:showViewDungeon()
  EchoesOfLoreMain_TopSubRowDungeon:SetHidden(false)
  EchoesOfLoreMain_TopSubRowArea:SetHidden(true)
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
    EchoesOfLore:clearView()
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
      --d("List: dungeons " .. k .. " v="..tostring(v) )
      --if(v.order~=nil)then d(" order="..tostring(v.order) ) end
      table.insert(validChoices, k)
    end
  end
  if(validChoices~=nil)then
    --local validChoicesS = validChoices
    --[[
    validChoicesS = table.sort( validChoices,  EchoesOfLore.SortDungeonData )   
    if(validChoicesS==nil)then
      validChoicesS = validChoices
      d("EchoesOfLore: bad sort (Dungeon)!")
      --table.sort( validChoices, EchoesOfLore.SortDungeonData )   
    end
    --]]
    for i = 1, #validChoices do
      local entry = comboBox:CreateItemEntry(validChoices[i], OnItemSelect1)
      comboBox:AddItem(entry)
    end
  end
  comboBox:SelectFirstItem()
  
  --
  EchoesOfLore:showViewDungeon2()
end

--SHOW/Setup Dungeon BOSS dropdowns
function EchoesOfLore:showViewDungeon2(dungeon)
  EchoesOfLore:debugMsg("showViewDungeon2= dungeon=" .. tostring(dungeon) )  
  --EchoesOfLoreMain_TopSubRowDungeon_DropdownDBoss
  EchoesOfLoreMain_TopSubRowDungeon_DropdownDBoss.comboBox = EchoesOfLoreMain_TopSubRowDungeon_DropdownDBoss.comboBox or ZO_ComboBox_ObjectFromContainer(EchoesOfLoreMain_TopSubRowDungeon_DropdownDBoss)
  local comboBox = EchoesOfLoreMain_TopSubRowDungeon_DropdownDBoss.comboBox
  comboBox:ClearItems()
  comboBox:SetSortsItems(false)
  local function OnItemSelect(_, choiceText, choice)
    EchoesOfLore:debugMsg(" choiceText=" .. tostring(choiceText) .. " choice=" .. tostring(choice) )  
    --ElderScrollsOfAlts:doCharacterSelected(choiceText, choice) --getQualityDict()[choiceText])
    EchoesOfLore.view.bossselected = choiceText
    EchoesOfLore:showDungeonText()    
    PlaySound(SOUNDS.POSITIVE_CLICK)    
  end
  local validChoices = {} --ElderScrollsOfAlts:ListOfCategories(true)  
  --local nonElem = {}
  --nonElem.name = "Overall"    
  --nonElem.text = "Overall"  
  --nonElem.order = 0
  --table.insert(validChoices, nonElem)
  --table.insert(validChoices, "Overall")  
  if(dungeon~=nil)then
    if(EchoesOfLore.Dungeons[dungeon]~=nil and EchoesOfLore.Dungeons[dungeon].bosses~=nil)then
      for k, v in pairs(EchoesOfLore.Dungeons[dungeon].bosses) do
        if k ~= nil then
          --Test TODO
          if(v.order==nil)then v.order = #validChoices end
          --local nonElem = {}
          --nonElem.name = k 
          --nonElem.order = v.order
          if(validChoices[v.order]~=nil) then
            v.order = v.order+1
          end
          validChoices[ v.order ] = k
          --table.insert(validChoices, nonElem)          
          --d("List: players " .. k)
          --table.insert(validChoices, k)
        end
      end
    end
  end
  --[[
  local dataLines2   = table.sort( validChoices,  EchoesOfLore.SortBossesData )
  if(dataLines2==nil) then
    dataLines2 = validChoices
    d("EchoesOfLore: bad sort (Bosses)!")
  end
  ]]--

  for i = 1, #validChoices do
    local entry = comboBox:CreateItemEntry(validChoices[i], OnItemSelect)
    comboBox:AddItem(entry)
  end
  comboBox:SelectFirstItem()
  
  --
  local sText = ""
  if(EchoesOfLore.Dungeons[dungeon]~=nil and EchoesOfLore.Dungeons[dungeon].text~=nil)then
    sText = EchoesOfLore.Dungeons[dungeon].text
    EchoesOfLore:debugMsg("showViewDungeon2 set sText")    
 
    local bossesDataL = EchoesOfLore.Dungeons[dungeon].bosses[0]
    if(bossesDataL~=nil)then
      EchoesOfLore.view.dungeonselected = bossesDataL.bossName
      EchoesOfLore:showDungeonText()    
    end
  end
end

--
function EchoesOfLore:showViewArea()
  EchoesOfLoreMain_TopSubRowDungeon:SetHidden(true)
  EchoesOfLoreMain_TopSubRowArea:SetHidden(false)
  EchoesOfLoreMain_SideContainer:SetHidden(false)

  EchoesOfLoreMain_TopSubRowArea_DropdownDName.comboBox = EchoesOfLoreMain_TopSubRowArea_DropdownDName.comboBox or ZO_ComboBox_ObjectFromContainer(EchoesOfLoreMain_TopSubRowArea_DropdownDName)
  local comboBox = EchoesOfLoreMain_TopSubRowArea_DropdownDName.comboBox
  comboBox:ClearItems()
  comboBox:SetSortsItems(true)
  local function OnItemSelect1(_, choiceText, choice)
    EchoesOfLore:debugMsg(" choiceText=" .. choiceText .. " choice=" .. tostring(choice) )  
    --ElderScrollsOfAlts:doCharacterSelected(choiceText, choice) --getQualityDict()[choiceText])
    EchoesOfLore:clearView()
    EchoesOfLore:showViewArea2(choiceText)
    EchoesOfLore.view.areaselected = choiceText
    PlaySound(SOUNDS.POSITIVE_CLICK)    
  end
  local validChoices = {} -- ElderScrollsOfAlts:ListOfCategories(true)
  --local nonElem = {}
  --nonElem.name = "None"  
  table.insert(validChoices, "_None"  )
  for k, v in pairs(EchoesOfLore.Zones) do
    if k ~= nil then
      --d("List: dungeons " .. k .. " v="..tostring(v) )
      --if(v.order~=nil)then d(" order="..tostring(v.order) ) end
      table.insert(validChoices, k)
    end
  end
  if(validChoices~=nil)then
    --local validChoicesS = validChoices
    --[[
    validChoicesS = table.sort( validChoices,  EchoesOfLore.SortDungeonData )   
    if(validChoicesS==nil)then
      validChoicesS = validChoices
      d("EchoesOfLore: bad sort (Dungeon)!")
      --table.sort( validChoices, EchoesOfLore.SortDungeonData )   
    end
    --]]
    for i = 1, #validChoices do
      local entry = comboBox:CreateItemEntry(validChoices[i], OnItemSelect1)
      comboBox:AddItem(entry)
    end
  end
  comboBox:SelectFirstItem()
  
  --
  EchoesOfLore:showViewArea2()
end

--SHOW/Setup Area
function EchoesOfLore:showViewArea2(area)
  EchoesOfLore:debugMsg("showViewArea2= Area=" .. tostring(area) )  
  EchoesOfLoreMain_TopSubRowArea_DropdownDBoss.comboBox = EchoesOfLoreMain_TopSubRowArea_DropdownDBoss.comboBox or ZO_ComboBox_ObjectFromContainer(EchoesOfLoreMain_TopSubRowArea_DropdownDBoss)
  local comboBox = EchoesOfLoreMain_TopSubRowArea_DropdownDBoss.comboBox
  comboBox:ClearItems()
  comboBox:SetSortsItems(false)
  local function OnItemSelect(_, choiceText, choice)
    EchoesOfLore:debugMsg(" choiceText=" .. tostring(choiceText) .. " choice=" .. tostring(choice) )  
    EchoesOfLore.view.area2selected = choiceText
    EchoesOfLore:SelectAreaText()    
    PlaySound(SOUNDS.POSITIVE_CLICK)    
  end
  local validChoices = {}
  if(area~=nil)then
    if(EchoesOfLore.Zones[area]~=nil)then
      for k, v in pairs(EchoesOfLore.Zones[area]) do
        if k ~= nil then
          if(v.order==nil)then v.order = #validChoices end
          if(validChoices[v.order]~=nil) then
            v.order = v.order+1
          end
          validChoices[ v.order ] = k
        end
      end
    end
  end

  --
  local nr = 1
  for i = 1, #validChoices do
    local entry = comboBox:CreateItemEntry(validChoices[i], OnItemSelect)
    comboBox:AddItem(entry)
  end  
  
  --buttons
  --clear buttons
  if(EchoesOfLore.view.buttons~=nil)then
    for index, value in ipairs(EchoesOfLore.view.buttons) do
      value:SetHidden(true)
    end
  end
  
  if(area~=nil and EchoesOfLore.Zones[area]~=nil)then
    --for key, value in pairs(EchoesOfLore.Zones[area]) do
    for ii = 1, #validChoices do
      local key   = validChoices[ii]
      local value = EchoesOfLore.Zones[area][key]
      --set buttons
      EchoesOfLore.view.buttons = {}
      --for key,value in pairs(validChoices) do
      local item = validChoices[i]
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
      s:SetDrawLayer(1)
      --
      s:SetClickSound('Click')
      s:SetMouseOverTexture('EsoUI/Art/ActionBar/actionBar_mouseOver.dds')
      s:SetNormalTexture('EsoUI/Art/ActionBar/abilityFrame64_up.dds')
      s:SetPressedMouseOverTexture('EsoUI/Art/ActionBar/abilityFrame64_down.dds')
      s:SetHandler('OnClicked',function(self)
        --EchoesOfLore:debugMsg(" choiceText=" .. tostring(choiceText) .. " choice=" .. tostring(choice) )  
        --EchoesOfLore.view.area2selected = s.name
        PlaySound(SOUNDS.POSITIVE_CLICK)            
        --Use Text of button and selected dungeon and boss to get longtext
        EchoesOfLore:SelectAreaText(self)
      end)
      s.ButtonName = value.name
      s.name = value.name    
      s:SetText(value.name)
      s:SetHidden(false)
      EchoesOfLore.view.buttons[nr] = s
      nr = nr + 1
    end
  end
  --button
  
  --finish
  comboBox:SelectFirstItem()
  --TODO show text for this one
  
  --[[
  local sText = ""
  if(EchoesOfLore.Zones[area]~=nil)then
    --sText = EchoesOfLore.Dungeons[dungeon].text
    --EchoesOfLore:debugMsg("showViewDungeon2 set sText")    
 
    local bossesDataL = EchoesOfLore.Zones[area].bosses[0]
    if(bossesDataL~=nil)then
      EchoesOfLore.view.areaselected = bossesDataL.bossName
      EchoesOfLore:SelectAreaText()    
    end
  end
  --]]
end

function EchoesOfLore:SelectAreaText(self)  
  --Use Text of button and selected dungeon and boss to get longtext
  local bText1 = nil
  local bText2 = nil
  if(self==nil)then
    EchoesOfLore:debugMsg("SelectAreaText: Button method has self as nil?")
    bText1 = EchoesOfLore.view.areaselected
    bText2 = EchoesOfLore.view.area2selected
  else 
    bText1 = EchoesOfLore.view.areaselected
    bText2 = self.ButtonName
    EchoesOfLore.view.area2selected = bText2
  end
  EchoesOfLore:debugMsg("SelectAreaText: bText1=" .. tostring(bText1).. " bText2=" .. tostring(bText2) )  
  local sText = ""
  if(bText1==nil)then
    EchoesOfLore:debugMsg("SelectAreaText: area is nil!")
    return
  end
  if(bText2==nil)then
    EchoesOfLore:debugMsg("SelectAreaText: item is nil!")
    return
  end
  
  local areaData = EchoesOfLore.Zones[bText1]
  if(areaData==nil)then  
    EchoesOfLore:debugMsg("SelectAreaText: areaData is nil!")
    return
  end
  
  local area2Data = EchoesOfLore.Zones[bText1][bText2]
  if(area2Data==nil)then
    EchoesOfLore:debugMsg("SelectAreaText itemData is nil!")
    return
  end
  local textData = area2Data.value
  if(textData==nil)then
    EchoesOfLore:debugMsg("SelectAreaText textData is nil!")
    return
  end
  EchoesOfLore:GetOrCreateTextBox(textData)
  EchoesOfLore.view.textData = textData
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

--SHOW/setup Text based on dungeon & boss selected
function EchoesOfLore:showDungeonText()
  EchoesOfLore:clearView()
  
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
  --Test TODO
  local validChoices = {}
  for k, v in pairs(textList) do
    if(v.order==nil)then v.order = #validChoices end
    if(validChoices[v.order]~=nil) then
      v.order = v.order+1
    end
    v.name = k
    validChoices[ v.order ] = v
  end
  --[[
  local dataLines2   = table.sort( textList,  EchoesOfLore.SortButtonData )
  if(dataLines2==nil)then
    --TODO clear data
    dataLines2 = textList
    d("EchoesOfLore: Bad sort (Buttons)!")
  end
  ]]--
  EchoesOfLore.view.buttons = {}
  for key,value in pairs(validChoices) do
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
    s.ButtonName = value.name
    s.name = value.name    
    s:SetText(value.name)
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
  EchoesOfLore.view.textData = textData
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



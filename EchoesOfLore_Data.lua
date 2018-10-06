----------------
-- EchosOfLore--
----------------

--
EchoesOfLore.Dungeons = {}

--
function EchoesOfLore:InitializeData()
  EchoesOfLore.Dungeons = {
      ["Arx Corinium"]      = { order=1 } ,
      ["Blackheart Haven"]  = { order=2 } ,
      ["Spindleclutch 1"]   = { order=3 } ,
      ["Spindleclutch 2"]   = { order=4 } ,
      ["Wayrest Sewers 1"]  = { order=5 } ,
      ["Wayrest Sewers 2"]  = { order=6 } ,
      ["White-Gold Tower"]  = { order=7 } ,
  }
  EchoesOfLore:setupArxCorinium()    
  EchoesOfLore:setupBlackheartHaven()  
  EchoesOfLore:setupSpindleclutch1()  
  EchoesOfLore:setupSpindleclutch2()  
  EchoesOfLore:setupWayrestSewers1()  
  EchoesOfLore:setupWayrestSewers2()  
  EchoesOfLore:setupWhiteGoldTower()
end

--
function EchoesOfLore:setupArxCorinium()   
  local dungeonName = "Arx Corinium"
  if(EchoesOfLore.Dungeons[dungeonName]==nil)then
    EchoesOfLore.Dungeons[dungeonName] = {}
  end
  EchoesOfLore.Dungeons[dungeonName].metadata = {}
  EchoesOfLore.Dungeons[dungeonName].text = {}
  EchoesOfLore.Dungeons[dungeonName].bosses = {}
  local bName = nil
  ---------
  ---------
  bName = "Fanged Menace"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 1,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "The first boss in Arx Corinium. He’s a snake miniboss, and isn’t very difficult as long as you stay away from his health leech ability.\nFanged Menace is surrounded by some adds which you should take care of before focusing on him.",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 2,
      text = "Frontal cone attack that causes knockback and damages severely any player caught in it.\nAOE Poison attack that absorbs health from those hit by it to the Boss. The red circle made underneath him while he curls up can damage heavily and also heal the boss.\nOther ads surrounding the boss\nHeavy melee attacks",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Strategy"] = {
      order = 3,
      text = "Deal with the ads first.\nThe tank should block the heavy Melee attack and keep the boss focused away from the group.\nAvoid the large AOE red circle as it can instantly wipeout any player within its reach.\n",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Tank"] = {
      order = 4,
      text = "The tank needs to look out for the heavy melee attack – block it.\n",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["DPS"] = {
      order = 5,
      text = "Stay out of the AOE poison damage ability\n",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Healer"] = {
      order = 6,
      text = "Stay out of the AOE poison damage ability\n",
  }  
  
  ---------
  ---------
  bName = "Ganakton the Tempest"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 2,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "The second boss in Arx Corinium. He can be quite lethal. Spreading apart is beneficial. Do not stack.",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 2,
      text = "The first ability Ganakton has is his frontal cone lightning breath. This should be easy to avoid.\nPeriodically electrifies himself and deals a moderate amount of damage to everyone in a few shock pulses. You don’t seem to be able to avoid this – just heal through it.\nHas a lightning wave attack. He will target a random player in the group and send a wave of lightning towards him. The wave will deal a high amount of Shock damage and stun anyone caught in it. You can get out of the stun with your interrupt / break free ability, if you have the stamina for it.\nFollowing the Lightning wave, he electrifies his tail and sends a bolt of lightning at the same player, dealing a lot of Shock damage and again stunning them on the ground.",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Tank"] = {
      order = 3,
      text = "Tank\n",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["DPS"] = {
      order = 4,
      text = "Avoid frontal cone, do not stack, avoid the lightning wave and stun, as he follows up with more damage.\n",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Healer"] = {
      order = 5,
      text = "Periodically electrifies himself and deals a moderate amount of unavoidable damage to everyone\n",
  }  
  
  ---------
  ---------
  bName = "Sliklenia the Songstress"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 3,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "The third boss in Arx Corinium. Do not kill the add, pet as it has an essential role in this fight, and you should NOT kill it.",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "Sliklenia has a heavy melee attack which the tank should block.\nWhen she becomes stationary and starts singing, she'll start dealing tons of damage in pulses around the room. The Songstress’ Pet creates a sonic shield at a random location in the room. The pet will retreat to the shield – you should follow.",
  }

  ---------
  ---------
  bName = "Matron Ixniaa"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 4,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "The fourth boss in Arx Corinium. She’s a miniboss and doesn’t have much health. She only has one ability to look out for, which can be lethal.\nIxniaa is surrounded by a bunch of adds, you should take them down first.\n",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "She periodically targets a random player, places a red circle beneath the player, and follows up with another circle, which will cover an even bigger area. The inner circle is the one you must avoid – it deals tons of damage and can be lethal if you’re not topped up. The outer circle also deals damage, but is much more manageable.",
  }

  ---------
  ---------
  bName = "Ancient Lurcher"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 5,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "The fifth boss in Arx Corinium. Just like the previous miniboss, Ancient Lurcher also has a bunch of adds around him. Kill them before you focus on him.",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "Ancient Lurcher casts a red circle beneath him, dealing damage to anyone caught in it. It should be easy to avoid.\nAncient Lurcher sometimes targets a random player with a green beam, which deals heavy poison damage.\nOnce Ancient Lurcher drops below 50% Health or so, he enrages and charges himself with Lightning, empowering his AOE ability.",
  }

  ---------
  ---------
  bName = "Sellistrix the Lamia Queen"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 6,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "The sixth and final boss in Arx Corinium.\nThe room is filled with water, but there are a couple of small islands which are safe to stand on. Staying in the water is bad.",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 2,
      text = "Sellistrix has a frontal cone scream which deals a lot of damage.\nThe tank should face Sellistrix away from the rest of the group.\nSellistrix periodically charges at random players, dealing a low amount of damage in the process.\nShe will start channeling lightning and target the small islands in the room, marked with red circles. Sometimes you have a safe island to go to, sometimes not.\nIt’s very important that Sellistrix isn’t standing in water when this ability goes off, or the water will become electrified and hurt everyone in it.\nThe lightning attack on the islands does deal a bit of damage, but less than in the water.\n",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Tank"] = {
      order = 3,
      text = "Face away from players as usual, she charges players randomly, electricity is worse in water, if she's in it then everyone else should not be!\ n",
  }
  
  --[[
  ---------
  ---------
  bName = "TEMP"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 1,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }
--]] 
  --Arx Corinium
end


function EchoesOfLore:setupBlackheartHaven()  
  local dungeonName = "Blackheart Haven"
  if(EchoesOfLore.Dungeons[dungeonName]==nil)then
    EchoesOfLore.Dungeons[dungeonName] = {}
  end
  EchoesOfLore.Dungeons[dungeonName].metadata = {}
  EchoesOfLore.Dungeons[dungeonName].text = {
    overview = "A pirate themed dungeon."
  }
  EchoesOfLore.Dungeons[dungeonName].bosses = {}
  local bName = nil
  ---------
  ---------
  bName = "Iron-Heel"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 1,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "Kill the ads quickly.",
  }
  --Blackheart Haven
end

function EchoesOfLore:setupSpindleclutch1()   
  local dungeonName = "Spindleclutch 1"
  if(EchoesOfLore.Dungeons[dungeonName]==nil)then
    EchoesOfLore.Dungeons[dungeonName] = {}
  end
  EchoesOfLore.Dungeons[dungeonName].metadata = {}
  EchoesOfLore.Dungeons[dungeonName].text = {
    overview = "A spider themed dungeon."
  }
  EchoesOfLore.Dungeons[dungeonName].bosses = {}
  local bName = nil
  ---------
  ---------
  bName = "Spindlekin"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 1,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }
  
  ---------
  ---------
  bName = "The Swarm Mother"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 1,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }
  
  ---------
  ---------
  bName = "Cerise the Widow-Maker"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 1,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }

  ---------
  ---------
  bName = "Big Rabbu"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 1,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }

  ---------
  ---------
  bName = "The Whisperer"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 1,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }
  --Spindleclutch 1
end

function EchoesOfLore:setupSpindleclutch2()   
  local dungeonName = "Spindleclutch 2"
  if(EchoesOfLore.Dungeons[dungeonName]==nil)then
    EchoesOfLore.Dungeons[dungeonName] = {}
  end
  EchoesOfLore.Dungeons[dungeonName].metadata = {}
  EchoesOfLore.Dungeons[dungeonName].text = {
    overview = "A spider themed dungeon."
  }
  EchoesOfLore.Dungeons[dungeonName].bosses = {}
  local bName = nil
  
  ---------
  ---------
  bName = "Mad Mortine"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 1,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }
  
  ---------
  ---------
  bName = "Blood Spawn"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 2,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }
  
  ---------
  ---------
  bName = "Praxin Douare"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 3,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }
  
  ---------
  ---------
  bName = "Flesh Atronach"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 4,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }
  
  ---------
  ---------
  bName = "Urvan Veleth"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 5,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }
  
  ---------
  ---------
  bName = "Vorenor Winterbourne"
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName] = {
      order    = 6,
      metadata = {},
      text     = {}
  }
  
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Overview"] = {
      order = 1,
      text = "",
  }
  EchoesOfLore.Dungeons[dungeonName].bosses[bName].text["Boss Mechanics"] = {
      order = 1,
      text = "",
  }
  --Spindleclutch 2
end

function EchoesOfLore:setupWayrestSewers1()   
  local dungeonName = "Wayrest Sewers 1"
  if(EchoesOfLore.Dungeons[dungeonName]==nil)then
    EchoesOfLore.Dungeons[dungeonName] = {}
  end
  EchoesOfLore.Dungeons[dungeonName].metadata = {}
  EchoesOfLore.Dungeons[dungeonName].text = {
    overview = "A sewer themed dungeon."
  }
  EchoesOfLore.Dungeons[dungeonName].bosses = {}
  local bName = nil
  
  --Wayrest Sewers 1
end

function EchoesOfLore:setupWayrestSewers2()  
  local dungeonName = "Wayrest Sewers 2"
  if(EchoesOfLore.Dungeons[dungeonName]==nil)then
    EchoesOfLore.Dungeons[dungeonName] = {}
  end
  EchoesOfLore.Dungeons[dungeonName].metadata = {}
  EchoesOfLore.Dungeons[dungeonName].text = {
    overview = "A sewer themed dungeon."
  }
  EchoesOfLore.Dungeons[dungeonName].bosses = {}
  local bName = nil
  
  --Wayrest Sewers 2
end

function EchoesOfLore:setupWhiteGoldTower()  
  local bName = nil
  
  --White-Gold Tower
end

--------
--Sort--
local dungeonSortKeys =
  {
    ["name"]          = { }, 
    ["text"]          = { tiebreaker = "name" }, 
    ["order"]         = { tiebreaker = "name", isNumeric = true }, 
  }
  
--Sort
function EchoesOfLore.SortDungeonData(a, b)
  return ZO_TableOrderingFunction( a.data, b.data, "order", dungeonSortKeys, ZO_SORT_ORDER_DOWN )
end
--Sort
function EchoesOfLore.SortDungeonData2(a, b)
  if(a==nil or a.order==nil)then return true end
  if(b==nil or b.order==nil)then return false end
  return a.order < b.order
end

--------
--Sort--
local bossesSortKeys =
  {
    ["name"]          = { }, 
    ["text"]          = { tiebreaker = "name" }, 
    ["order"]         = { tiebreaker = "name", isNumeric = true }, 
  }
  
--Sort
function EchoesOfLore.SortBossesData(a, b)
  return ZO_TableOrderingFunction( a, b, "order", bossesSortKeys, ZO_SORT_ORDER_DOWN )
end
function EchoesOfLore.SortBossesData2(a, b)
  if(a==nil or a.order==nil)then return true end
  if(b==nil or b.order==nil)then return false end
  return a.order<b.order
end
--------
--Sort--
local buttonSortKeys =
  {
    ["name"]          = { }, 
    ["text"]          = { tiebreaker = "name" }, 
    ["order"]         = { tiebreaker = "text", isNumeric = true }, 
  }
  
--Sort
function EchoesOfLore.SortButtonData(a, b)
  return ZO_TableOrderingFunction( a, b, "order", buttonSortKeys, ZO_SORT_ORDER_DOWN )
end

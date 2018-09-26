----------------
-- EchosOfLore--
----------------

--
EchoesOfLore.Dungeons = {}

function EchoesOfLore:InitializeData()
  EchoesOfLore.Dungeons = {
     -- ["None"]      = {name="None" } ,
      ["Arx Corinium"]      = { } ,
      ["Blackheart Haven"]  = { } ,
      ["Spindleclutch 1"]   = { } ,
      ["Spindleclutch 2"]   = { } ,
      ["Wayreset Sewers 1"] = { } ,
      ["Wayreset Sewers 2"] = { } ,
      ["White-Gold Tower"]  = { } ,
  }
  EchoesOfLore.Dungeons["Arx Corinium"].text = ""
  EchoesOfLore.Dungeons["Arx Corinium"].bosses = {
    ["TEMPLATE"] = {
      text       = "",
      mechanics  = "",
      strategy   = "",
      strattanks = "",
      stratdps   = "",
      stratheals = "",
    } ,
  }
  
  --EchoesOfLore.Dungeons["Spindleclutch 1"].name = "Spindleclutch 1"
  EchoesOfLore.Dungeons["Spindleclutch 1"].text = 
      "Spindleclutch is a dungeon in northeastern Glenumbra, it contains a lot of spiders!"
  EchoesOfLore.Dungeons["Spindleclutch 1"].bosses = {
     ["Spindlekin"] = {
           text       = "Spindlekin is a boss...\n\nBoss Mechanics:\n Summons spider minions throughout the fight. Will devour dead spider minions to regain health.\n\nGeneral:\n Stack up around the boss to maximize area healing & damage output when dealing with adds.\n\nTank Strategy:\n Focus on boss. Only tank adds when healer is in danger.\nBash the boss to interrupt the self-heal from devouring minion corpses.\n\nDPS Strategy:\n Burn down the boss.\n\nHeals Strategy:\n Run to the tank if adds are becoming a problem for you",
      } ,
     ["Swarm Mother"] = {
      text       = "Boss Mechanics:\n\nSpawns adds throughout the fight, Powerful melee heavy attack, Leaps at a random member of the group.\n\nGeneral\nStack around the boss to maximize area healing & damage output.\nThis also minimizes time lost when the boss leaps to a random target.\n\n\nTank\nFocus on keeping the boss occupied. Only tank adds if healer is in danger or you have extra resources.\nBoss will randomly charge group members, regardless of an active taunt.\nBlock boss's heavy attack. (high damage and a knock-back)\n\n\nDPS\nFocus on the adds whenever they are spawned to reduce stress on the healer.\n\n\nHealer\nTank's health can spike if a heavy attack is not blocked\nRandom members of group will be charged for heavy physical damage\n",
    } ,
    ["Cerise the Widow-Maker"] = {
      text       = "Boss Mechanics:\nPulls with a group of Fight's Guild trash mobs\nSelf buffs to increase damage output, Can immobilize players, Heavy attack\n\nTank\nFocus attention on the boss and follow the same strategy as the trash mob pulls.\n\nDPS\nFocus on the trash mobs using the same burn order that you have been using through previous trash mob pulls (either Healer -> Caster DPS -> Melee or Caster DPS -> Healer -> Melee). Finish with Cerise herself.\n\nHealer\nExpect heavy damage on the tank due to Cerise's powerful attacks and other mobs.\n\n",
    },
    ["Big Rabbu"] = {
      text       = "Boss Mechanics:\nPulls with a group of Fight's Guild trash mobsCan pull players to him (instant)Directional charge (his path will be shown in red)\n\nTank\nTank Rabbu and any other mobs according to the strategy you used for Cerise and other trash mob pulls.Block Rabbu's charge attack if possible, which will stop it from hitting anyone else.\n\nDPS\nFocus on the mobs using the same strategy as Cerise and other trash mob pulls. (Either Healer -> Caster DPS -> Melee or Caster DPS -> Healer -> Melee)\n\nHealer\nSimilar to Cerise, expect the tank to take heavy damage. Anyone who gets in the way of Rabbu's charge will need significant healing.",
      },
      ["The Whisperer"] = {
      text       = "",
      },
      
  }

end

--Sort
local dungeonSortKeys =
  {
    ["name"]          = { }, 
  }
  
--Sort
function EchoesOfLore.SortDungeonData(a, b)
  return ZO_TableOrderingFunction( a.data, b.data, "name", dungeonSortKeys, ZO_SORT_ORDER_DOWN )
end


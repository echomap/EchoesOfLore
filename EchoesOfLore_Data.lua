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
      ["Wayrest Sewers 1"]  = { } ,
      ["Wayrest Sewers 2"]  = { } ,
      ["White-Gold Tower"]  = { } ,
  }
  EchoesOfLore.Dungeons["Arx Corinium"].text = ""
  EchoesOfLore.Dungeons["Arx Corinium"].bosses = {
    ["Fanged Menace"] = {
      order=1,
      text       = "Boss Mechanics:\nFrontal cone attack that causes knockback and damages severely any player caught in it.\nAOE Poison attack that absorbs health from those hit by it to the Boss. The red circle made underneat him while he curls up can damage heavily and also heal the boss.\nOther ads surrounding the boss\nHeavy melee attacks\n\nStrategy:\nDeal with the ads first.\nThe tank should block the heavy Melee attack and keep the boss focused away from the group.\nAvoid the large AOE red circle as it can instantly wipeout any player within its reach.\n",
    } ,
    ["Ganakton the Tempest"] = {
      order=1,
      text       = "Boss Mechanics:\nLightning Wave that is emitted towards a random player. The wave can cause high amounts of Shock damage and stun anyone close-by.\nImmediately after the wave, the Boss will send a lightning bolt at the same player causing Shock damage and stunning them again.\nGanakton can also electrify all players with a shock pulse every now and then. This does medium levels of damage but is unavoidable.\nFrontal cone lightning breath\n\nStrategy:\n\nDue to all the shock waves that can stun players, it is best to spread out across the room to give yourself plenty of room to avoid the Waves and ensure you don't hurt another player in the process.\nIf you get hit by the Wave, you can escape the Stun element by using an Interrupt or break free ability using your stamina.\nThe shock pulses are difficult to avoid so it is best to just heal through them.\n",      
    } ,
    ["Sliklenia the Songstress"] = {
      order=1,
      text       = "Boss Mechanics:\nA pet ad that you should not kill until the boss is dead.\nSound pulse that does high amounts of damage when the boss sings.\nHeavy melee attack\n\nStrategy:\nDON'T kill the pet before killing the boss. The ad is actually beneficial to the players in order to minimize the damage taken from the singing. When the boss sings, the pet will create a sonic shield in a random location in the room and retreat to it. You should follow the pet into that shield to avoid taking the crazy amounts of damage the Sound pulses can deal.(She must be a horrible singer because you can die from her singing!)\nKill the pet after the Songstress dies.\nTank should block the heavy melee attacks.\n",
    } ,
    ["Matron Ixniaa"] = {
      order=1,
      text       = "Boss Mechanics:\nRandomly places 2 circles (1 big and 1 small) underneath a player.\nBunch of ads\n\nStrategy:\nDeal with the ads first as they can be overwhelming if not taken care of from the start.\nThe inner circle (smaller one) must be avoided as it can deal large amounts of damage and even kill you if you're not at full health. The outer circle (bigger one) does damage from which you can recover.\nHealer should try to keep the player targeted with the 2 circles at full health as a precaution\n",      
    } ,
    ["Ancient Lurcher"] = {
      order=1,
      text       = "Boss Mechanics:\nRandomly targets a player with a green beam that does severe poison damage.\nRed circles underneath the Boss that damage those caught inside.\nEnrage and Lightning charge that strengthens his AOE ability once his health is below 50%\nBunch of ads\n\nStrategy:\nAttack the ads first before you focus on the boss.\nAvoid the green beams as they can be fatal.\n",      
    } ,
    ["Sellistrix the Lamia Queen"] = {
      order=1,
      text       = "Boss Mechanics:\nCharges at players at random doing small amounts of damage\nLightning strikes channelled at certain islands in the room marked by red circles. During this attack, if the Queen is in the water, the water becomes electrified and any players standing in the water will be electrocuted.\nFrontal cone scream that does heavy damage.\n\nStrategy:\nTank should focus the Queen facing away from the rest of the group to ensure your group is not hit by the nasty frontal scream.\nAvoid being in the water as you risk being electrocuted if the lightning strike takes place while the Queen is standing in water.\nThe islands are a safe bet but they get targeted by the lightning AOE from time to time.\nIt may be better to just stay on the island and endure the AOE hit rather than stepping in the electrified water if you have a dedicated healer on your group.\nJumping around from island to island can be safer but prove to be more dangerous for the group as you risk them running into a frontal cone attack aimed at you as you move about.\n",      
    } ,
  }
  
  --[[
  ["TEMPLATE"] = {
      order=1,
      text       = "",      
    } ,
  --]]
  
  --EchoesOfLore.Dungeons["Spindleclutch 1"].name = "Spindleclutch 1"
  EchoesOfLore.Dungeons["Spindleclutch 1"].text = 
      "Spindleclutch is a dungeon in northeastern Glenumbra, it contains a lot of spiders!"
  EchoesOfLore.Dungeons["Spindleclutch 1"].bosses = {
     ["Spindlekin"] = {
          order=1,
          text       = "Spindlekin is a boss...\n\nBoss Mechanics:\n Summons spider minions throughout the fight. Will devour dead spider minions to regain health.\n\nGeneral:\n Stack up around the boss to maximize area healing & damage output when dealing with adds.\n\nTank Strategy:\n Focus on boss. Only tank adds when healer is in danger.\nBash the boss to interrupt the self-heal from devouring minion corpses.\n\nDPS Strategy:\n Burn down the boss.\n\nHeals Strategy:\n Run to the tank if adds are becoming a problem for you",
      } ,
     ["Swarm Mother"] = {
      order=1,
      text       = "Boss Mechanics:\n\nSpawns adds throughout the fight, Powerful melee heavy attack, Leaps at a random member of the group.\n\nGeneral\nStack around the boss to maximize area healing & damage output.\nThis also minimizes time lost when the boss leaps to a random target.\n\nTank\nFocus on keeping the boss occupied. Only tank adds if healer is in danger or you have extra resources.\nBoss will randomly charge group members, regardless of an active taunt.\nBlock boss's heavy attack. (high damage and a knock-back)\n\n\nDPS\nFocus on the adds whenever they are spawned to reduce stress on the healer.\n\n\nHealer\nTank's health can spike if a heavy attack is not blocked\nRandom members of group will be charged for heavy physical damage\n",
    } ,
    ["Cerise the Widow-Maker"] = {
      order=1,
      text       = "Boss Mechanics:\nPulls with a group of Fight's Guild trash mobs\nSelf buffs to increase damage output, Can immobilize players, Heavy attack\n\nTank\nFocus attention on the boss and follow the same strategy as the trash mob pulls.\n\nDPS\nFocus on the trash mobs using the same burn order that you have been using through previous trash mob pulls (either Healer -> Caster DPS -> Melee or Caster DPS -> Healer -> Melee). Finish with Cerise herself.\n\nHealer\nExpect heavy damage on the tank due to Cerise's powerful attacks and other mobs.\n\n",
    },
    ["Big Rabbu"] = {
      order=1,
      text       = "Boss Mechanics:\nPulls with a group of Fight's Guild trash mobsCan pull players to him (instant)Directional charge (his path will be shown in red)\n\nTank\nTank Rabbu and any other mobs according to the strategy you used for Cerise and other trash mob pulls.Block Rabbu's charge attack if possible, which will stop it from hitting anyone else.\n\nDPS\nFocus on the mobs using the same strategy as Cerise and other trash mob pulls. (Either Healer -> Caster DPS -> Melee or Caster DPS -> Healer -> Melee)\n\nHealer\nSimilar to Cerise, expect the tank to take heavy damage. Anyone who gets in the way of Rabbu's charge will need significant healing.",
      },
      ["The Whisperer"] = {
      order=1,
      text       = "",
      },
  }

  EchoesOfLore.Dungeons["Wayrest Sewers 1"].text = ""
  EchoesOfLore.Dungeons["Wayrest Sewers 1"].bosses = {
    ["Slimecraw"] = {
      order=1,
      text       = "Slimecraw has a frontal cone tailswipe. It deals high physical damage and does a pretty big knockback.",
    } ,
    ["Investigator Garron"] = {
      order=1,
      text       = "Garron likes to teleport around the room. Just keep track of him.\n\nThe main mechanic in this fight is the green orb Garron summons. It will start chasing after random players, dealing damage to anyone caught in its radius. If the orb is chasing you, run away, but make sure you don’t drag the orb through your group members.\n\nGarron periodically summons two Restless Soul ghosts with 717 Health on the opposite sides of the room. The ghosts have ranged attacks, and they should be taken down asap.\n\nGarron also has a highly damaging ranged knockback which seems to prefer distant targets.",      
    } ,
    ["Uulgarg the Hungry"] = {
      order=1,
      text       = "Uulgarg has a AOE fear ability.\n\nUulgarg has a nasty heavy melee attack, which deals a lot of damage unless blocked.\n\nHe likes to do it right after he has feared everyone. This could potentially kill the tank unless he has enough Stamina to break out of the fear and block the attack.\n\nHe sometimes stops and does a whirlwind attack around him, dealing physical damage.",
    } ,
    ["The Rat Whisperer"] = {
      order=1,
      text       = "He periodically casts a magic AOE damage spell at the tank, indicated with a red circle.\n\nThe boss shouts “Come to me my minions” as he summons a bunch of low Health skeevers to aid him.\n\nThe Rat Whisperer sometimes casts a cold damage root spell on the tank.",      
    } ,
    ["Varaine Pellingare"] = {
      order=1,
      text       = "The tank needs to look out for Varaine’s heavy melee attack, and block it.\n\nHe periodically casts a quickly expanding AOE spell around him that deals a lot of damage and briefly stuns anyone caught in it.\n\nHe has a frontal cone attack, seemingly to a random direction with a jump animation associated with the ability thatis tricky to avoid. Getting hit by the frontal cone attack will knock you down and deal medium physical damage.",      
    } ,
    ["Allene Pellingare"] = {
      order=1,
      text       = "The tank needs to block Allene’s heavy melee attack.\n\nAllene will do a Teleport Strike to random targets, which deals a lot of damage and briefly snares the target.\n\nAllene vanishes roughly every 25% of her Health to summon Fiendish Hallucinations. They are large bats with 562 Health. The number of bats summoned increases after each summon. Normally bats are immune to root effects, but for some reason these bats are not. A dragonknight with Dark Talons will completely destroy them.\n\nAfter the last group of bats has been summoned, Allene should be at around 25% Health. Allene takes on a ghost form and seems to deal a bit more damage in the last phase.",      
    } ,
  }


end

--Sort
local dungeonSortKeys =
  {
    ["name"]          = { }, 
    ["order"]         = { tiebreaker = "name", isNumeric = true }, 
  }
  
--Sort
function EchoesOfLore.SortDungeonData(a, b)
  return ZO_TableOrderingFunction( a.data, b.data, "order", dungeonSortKeys, ZO_SORT_ORDER_DOWN )
end


Masters of the Heist
{:.title}

_Masters of the Heist_ is a cooperative heist game set in a world of many possibilities. You are a uniquely skilled individual in a career of high-risk, high-reward thievery. You work with other skilled criminals to quietly traverse buildings while dealing with obstacles like closing gates, guards, locks, sensors, and cameras.

During each heist, you will collaborate using simultaneous gameplay. You will plan your heist, but you will also have to know when to abandon your plan. You use Ideas💡 to get the actions you need, but don't spend too many... you'll need those Ideas💡 to escape, too!

You will start as an Amateur criminal with Amateur skills who is new to River City. But over time, hopefully with a few good decisions along the way, you and your teammates will level up your characters and skills as you make your way through the city. Each heist unlocks new opportunities through doing favors for Fixers.

Version ⏱

_Please note that this rulebook is a draft. We are in the process of blind playtesting and will be testing the readability and usability of this document. Expect change._


<div class="pagebreak"/>

# Table of Contents

* TOC
{:toc}

# The Pieces

{:.parts-list}

* 32 Blank/Security hex tiles
* 4 Lockdown Gate hex
* 5 Entrance square tiles
* 16 Character cards
* 24 Skill cards
* 42 Event cards
* 6 Item cards
* 6 Special Event cards
* 12 Fixer cards
* Noise tracker card
* 12 Lock chits (circle)
* 12 Camera chits (circle)
* 14 Guard chits (circle)
* 4 Jewel chits (circle)
* 1 USB key chit (circle)
* 4 Control Panel chits (circle)
* 8 Pressure Sensors (ring)
* 2 Story chits (circle)
* 36 Idea💡 chits (oval)
* 4 Player meeples
* 1 NPC pawn (white)
* 48 Planning mini hex chits
* 5 six-sided dice
* 12 Petty Cash chits
* 4 Game Helps

<div class="pagebreak"/>

Page
{:.pagenumber}



# Setting Up

**Step 1. As a team, decide your next heist.** Heists are available to you in the River City booklet. Each heist is labelled with a difficulty level and any other pre-requisites.

**Step 2. Set up the board** in the middle of the table. Following the diagram for your chapter, set up the hex tiles so that they match the picture. Place any Loot chits, Prisoner, and/or Security Systems according to the diagram. If the diagram depicts a shield, then use the Security side of the tile, in all other cases use the Blank side.

Some boards have already-revealed security chits. The Chapter will also indicate how many Guards, Locks, and Camera chits should go into the bag. Leave the other Security chits by the board (they are **the supply**).

**Step 3. Build Characters.** Every player gets one Character card and two Skill cards. Unless you have levelled up in a previous heist, start with Amateur. Otherwise, continue with the character build from your sheet.

Tip: The back of this booklet has some pre-built character+skill pairings.
{:.tip}

**Step 4. Distribute player tokens.** Distribute the 6-sided die, and pawn according to your color. Distribute the Planning tokens (small colored hex chits) to each character according to their Planning Memory on their character card. *For example, the Lookout has a Planning Memory of 6, so she gets 6 planning tokens*. Place remaining Planning tokens back in the box.

**Step 5. Distribute initial Ideas💡** to each player according to their character.

**Step 6. Set up Noise tracker** in view of everyone and according to the number of players (3- or 4-player). Place the Noise Tracker marker on its starting place.

**Step 7. Set up the Event cards** according to the scenario, using the numbered cards in the order indicated. The deck should be entirely face-up with the first card on the top and the last card on the bottom.

**Step 8. Select Fixers**. Determine which Fixers you will use for planning this heist. If this is your first heist, start with *Old Friend*.

# Play Overview

## The Board

<div class="example-right">
  <img src="../img/figure_board.svg"><br>
  Blue is adjacent to a Camera, but not to a Guard.
</div>

The board is a set of modular double-sided hex tiles. All hexes are considered symmetrical (i.e. orientation does not matter). For most tiles, each tile is Blank on one side, and is a Security tile on the other side. A **Security tile** represents an unknown Security Chit (see below).

Some tiles have **Lockdown Gates** printed on them, and they are lettered A,B,C, and D. A character may enter or exit this hex freely. Security Events may remove this tile from the board. Lockdown Gates are always removed in order: the A tile will be removed first, then B, and so on.

**Adjacent**. You are considered adjacent to something if you are on a tile that shares a border with another tile. Being on the same tile is *not* considered adjacent.

**Entrances & Exits**. Each board has one or more entrances/exits. These Entrances represent a space. If a character is on one of these spaces they are considered to be Outdoors, otherwise they are Indoors. An Entrance tile is also considered an Exit.

**Limit 2 to Entrance**. By default, unless the scenario specifies otherwise, Entrance/Exit tiles are limited to 2 characters at the beginning of the heist. This limit does not apply to the Escape phase, although the scenario may impose additional limits.

**External**. Some abilities refer to "external sides", which are a side of a hex tile that does not lead to a fully-enclosed space by hexes (see figure). An "external tile" is a tile with at least one external side.

**Gaps**. Some abilities refer to a "non-tiled gap", which is a hex-spaced area between two hex tiles that does *not* have a hex (see figure).

## Security Chits

Security Chits are randomized obstacles that your team will encounter. Security chits are generally unknown at the beginning of the heist, and are placed in the security bag to be drawn at random throughout the heist.

**Reveal and Auto-Reveal**. Immediately when a character is adjacent to a unknown Security tile (i.e. no Security chit placed yet), the chit is "auto-revealed" where you remove a random chit from the bag and place it on the tile in its Active state. A Security chit may also be placed with a **Reveal** (🔍) sub-action (see below).

|  Name  |                  Active                  |                      Inactive                      | Behavior                                                                                                                                                                             |
|:------:|:----------------------------------------:|:--------------------------------------------------:| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Guard  |  ![guard](fig_chit_guard.png)<br>Guard   |    ![subdued](fig_chit_subdued.png)<br>Subdued     | _Slows you down_. If you share a space with a Guard, you may not leave the tile until he is Subdued. You may move into a space with a Guard.                                         |
|  Lock  | ![locked](fig_chit_locked.png)<br>Locked |   ![unlocked](fig_chit_unlocked.png)<br>Unlocked   | _Prevents passage._ You may not enter a Locked tile at any time. You may exit a locked tile if it was re-locked while you were on it.                                                |
| Camera |   ![live](fig_chit_camera.png)<br>Live   | ![disabled](fig_chit_disconnected.png)<br>Disabled | _Increases Alerts._ You may enter a space with a Live Camera, but raise an Alert (⚠) by 1. If a Disabled camera is powered back on while a player is on it, raise an Alert (⚠) by 1. |
{:.security-table}

**More chits in the back.** Other chits that can go into the security bag can be found in the back of the rulebook.

## Actions & Sub-Actions

Skills and Characters allow you to take Actions. Most Actions are a grouping of Sub-Actions with a name (e.g. Punch 👊➜🔊🔊). The Sub-Actions are:

* ➜ is  **Move** to an adjacent, planned, not locked tile
* 🔓 is **Unlock** 1 locked, adjacent tile
* 👊 is **Subdue** 1 guard on or adjacent to your tile
* 📷 is **Disable** 1 camera on or adjacent to your tile
* 💡 is Add 1 **Idea** to your character
* 🔍 is **Reveal** 1 security token anywhere on the board
* 💰 is **Loot:** Gain $1k from the supply and place it on your character.
* 🔊 is Increase the **Noise** level by 1 (Required)
* ⚠ is  **Alert**. Discard the top Event card. (Required)
{:.subactions}

<div class="pagebreak"/>

<div class="characters">
## Characters

![character figure](figure_character_00.png)

Each Character card has:

* **Level**. Amateur or Pro
* **Planning Memory**. The number of pre-planned hex tiles your character may move through during a heist.
* **Initial Ideas**. The number of Ideas 💡 you start with at the beginning of each heist.
* **Default Actions**. Actions that are available regardless of your die roll. Some Characters have two Default Actions, others have three.
* **Ability**. What the character can uniquely do.
  - Some abilities will have a _Use this action..._ sentence referring to a Default Action space below. You must use your Action to make use of this ability.
  - Some abilities have a "Once per heist..." sentence. Place the once-per-heist token on this character at the beginning of the heist and discard when used.
  - Otherwise, the ability is a passive effect, i.e. may do the ability *in addition to* your Action. Specific character abilities override any rules in this document.
{:.figure_list}

</div>

<div class="clear-both"/>

<div class="skills">

## Skills

![character figure](figure_skill_00.png)

Each character gets two Skills. Each Skill has six Actions *①* that each correspond to a die roll *②*. During a heist, you will be rolling your die to determine which Actions are available to you. Every skill is either Amateur or Pro.

**Complementary skills**. When building a character, use Lacks *③* to see what the skill is missing so you can find a good combination.

</div>

## Events

![event figure](figure_event.png)
{:.card-portrait .card-right}

The Event cards represent the potential Security Events you will encounter each round. Each scenario will have a series of Events that you will progress through, called the **Event Deck**. This deck will remain _face-up_ at all times.

**One Event per round**. You will not be affected by _every_ event in the deck, rather, you will be encountering _one_ event each round and which event happens will be determined by a variety of factors.

**Raise Alert**. Every time you are told to "Raise ⚠", remove the topmost card and discard it for the rest of the heist. The top-most Event in the deck is the Active Event.

**Plan ahead**. You are welcome (encouraged!) to look ahead at potential upcoming events at any time. We recommend designating one person to keep track of the events and warn the group of potentially bad upcoming events.

## Crises

![crisis figure](figure_crisis.png)
{:.card-portrait .card-right .rotate-left}

Every Event Deck will have a few Crisis cards in them. They are particularly strong and can create big problems for any team of scoundrels.

**All Crises will happen**. Unlike Events, all Crises are guaranteed to happen in a heist. You will be doing all encountered Crisis cards _after_ your round's Event. (_see Phase 3. Event Phase for more details_).

**Not an Alert**. Crisis cards do _not_ count as Alerts. When a Crisis card is the top-most card in the Event Deck, immediately set it aside and continue dealing Event cards.

To summarize, you will be doing one Event per round, then zero or more Crises per round.

<div class="pagebreak"></div>

## Noise

Every action has a cost. The Noise Tracker card is used for determining how many Noise(🔊) sub-action penalties your team has incurred.

For each 🔊 your teammates incur, raise the Noise tracker by one. If the Noise tracker reaches a space with an Alert ⚠, immediately Raise ⚠ (see _Events_). If the Noise marker gets to the final slot, then the Escape Phase is Initiated at the end of the round (see Escape Phase). Note that the card flips over to accommodate all of the slots.

<div class="loot">

## Loot Chits

<img src="../img/figure_loot.svg">

The objective of the heist is (usually) to steal Loot chits, which can be  Jewels or Cash, or other tokens you may unlock. At any time when a character shares a space with Loot, they may immediately place that Loot chit on their Character card.

**Insta-transfer**. A character may also "drop" loot on their current space for no cost, which means that two characters may effectively "insta-transfer" loot from one to another when sharing a space.

**Not Ours Until It's Out**. When a character with Loot gets Outdoors, the team has acquired that loot for the heist. For Cash, increase the Team Cash tracker accordingly.

**Cash is one item.** Any amount of cash in one place is considered to be one piece of loot no matter how many chits it takes to represent it.

</div>

## Fixers

![fixer figure](figure_fixer.png)
{:.card-portrait .card-right .rotate-right}

Throughout your time in River City, you will be introduced to various people who can help your planning. Completing heists give you access to new abilities and ways to spend your Team Cash. You can use as many Fixers as you have unlocked in planning.

**Get the lay of the land**. You are welcome (encouraged!) to read ahead and plan your path through River City. There are no "spoilers" narrative-wise. Fortune favors the prepared.

<div class="pagebreak"/>

# Heist Gameplay

The structure of each heist is:

  <ol class="gameplay-structure">
    <li>The Plan
    </li>
    <li>The Heist: (1) Roll, (2) Action Phase, (3) Event. Repeat until Escape Phase.
    </li>
    <li>Level Up</li>
  </ol>



## Part I: The Plan

<div>

<div class="example-right">
<img src="../img/figure_planning.svg"><br>
Blue and Red place their planning tokens.
</div>

**Visit the Shop.** Your heists will earn you money to purchase Items.
*Note: on your first heist, you have $0k team cash and therefore cannot purchase anything from the shop*


**Place Planning Tokens**. With your team, you will collaboratively come up with a plan of how you will pull this Heist. Every time you do a Move➜, you *must* move onto a hex that you have **Planned** with a Planning Token of your color. Thus, mark every hex tile that you will be allowed to move on by placing a Plan token of your color on the hex tiles you will (probably) move onto. Entrance tiles do not need a token.



*Note:* Unless a special ability allows you to re-plan mid-heist, you will not be able to change these planning tokens!
{:.tip}

**Use your Fixers**. Decide which Fixers you will use during Planning and use their abilities.

**Start on Entrances**. Place your Character pawn on the Entrance space where you will plan to start.
The default limit character limit per Entrance is 2 (unlimited during Escape phase.) Some scenarios dictate a different a limits on this.

**No auto-reveals yet**. Do not auto-reveal until Phase 2 if your character's starting place is adjacent to a security tile.

</div>

<div class="clear-both"/>

## Part II: The Heist

Repeat Phase 1 through 3 until the Escape Phase is initiated.

### Phase 1. Roll

Everybody simultaneously rolls their die.

### Phase 2. Action

In this phase, you use your die to execute one Action. You have a minimum of four options: at least two Actions from your Character and one Action from each Skill.

**Modify rolls**. You may also use any number of your Ideas💡 to modify the die roll by 1 each. You may "wrap around", that is, spend an 💡 to go from a 6 to a 1 and vice versa.

**Interleaving Subactions**. During the Action phase, everyone is working collaboratively and simultaneously. You decide which Action to take, and how to execute your sub-actions. You may execute your sub-actions in any order. You may interleave your sub-actions with the sub-actions of other players. Doing this part effectively takes teamwork and is the key to victory!

**Undoing**. When you begin an Action, place your die on that Action to indicate your commitment. If unknown information is revealed after you commit to an Action, your Action cannot be undone.

**Required subactions** The Noise(🔊) and the Alert(⚠) sub-actions are required, but all other sub-actions are not required.

*Tip: Wait to account for noise until the end of Action phase. Ask everyone to hold up a finger for the number of noises they incurred - which they can see from the die sitting on the action they took.*
{:.tip}

*Example of Modify Roll*. Phil as the Angry Locksmith may always take Pick🔓🔊 or Walk🔊➜ regardless of what he rolled. Suppose he has the Wing It and Smash 'n' Grab Skills, and rolled a 1, then he also has Punch👊🔊🔊➜ and Discover🔍🔍 as options. If he spends an 💡, then he also has Smash📷🔊🔊➜, Grab💰🔊, Strongarm🔓👊🔊🔊➜, and Scamper🔊🔊🔊➜➜ available.*
{:.example}

*Example of Interleaving.* Kelly takes Discover🔍🔍 and reveals a guard one space away from Tim. Tim, with this new information, then chooses to take Punch👊🔊🔊➜, and does a ➜ first, then a 👊 on the newly-discovered guard, then increases the 🔊 by 2.*
{:.example}

*Example of Undoing*. Derek takes the Sprint(🔊🔊➜➜➜) action but after his first ➜ he Auto-Reveals a Lock in his path. Derek cannot undo his action. Fortunately, Jacob is one space away from the lock and takes Shim(🔓🔊🔊➜), which lets him ➜ and then 🔓. Derek continues with his other ➜➜. The noise level goes up by 4.*
{:.example}

**Initiate escape any time**. You may opt to initiate Escape Phase at any time (see *Escape Phase*).

**No passing**. You may NOT opt to "pass". You MUST choose an Action on your Character or Skills.

**No alphas**. You have the final say about what to do with your own character.

### Phase 3. Event

When all players have finished their Actions and all noise has been accounted for on the Noise Tracker, the team enters the Event phase.

**Active Event**. First, pick up the Event card that was on the top of the deck at the start of this phase. This is the Active Event. Read the text as instructed by the card. Some Events may incur more "Raise ⚠", in which you deal additional cards off the Event deck as you would during the Character Action phase (the Active Event card does not change).

**Discard Active Event**. When the Active Event is finished, even if it had no effect, discard the card.

**Events then Crises**. Follow any Crisis cards you have set aside this round. Multiple Special Events should be executed in the order they were encountered. Discard them after use.

**No actions or abilities**. Characters may not take actions or use abilities during this phase, unless the text on their card explicitly says so.

**Take from supply**. Whenever an Event or Special Event card calls for a new security tokens to be placed, take the chit from the *supply* (not the bag).

**Sound the Alarm**. If the *Sound the Alarm* card is discarded or is the Active Event, immediately enter the Escape Phase. Otherwise, proceed back to Roll for Skill.

### Escape Phase

When the Escape Phase is initiated, all Gates close and all Security chits are revealed. Then, each character who has not reached an exit (Entrance tile) determines if they can reach it.

**Escape Moves**. Determine and declare the number of Escape Moves your character will take to an exit. Ignore Plan tokens (Escape Moves do not need prior planning). Locked tiles are impassable. Exiting an Unsubdued Guard space costs one extra Escape Move per guard (e.g. two for one guard, three for two guards). Cameras and Pressure Sensors have no effect during Escape. Each leftover 💡 you have may be used for 1 Escape Move.

**Last Ditch Effort**. After you have declared your Escape moves and used up all of your 💡, you may roll your die. The number shown on the die is equal to the number of Escape Moves you may use to reach an Exit. If you still cannot reach an Exit, you are Busted.

**No costly abilities** You MAY NOT use abilities that cost 🔊 or ⚠ during the Escape Phase.

*For example,* SEWER CRAWL is not allowed during Escape, but GREAT IN A PINCH is allowed
{:.example}

**Insta-transfers**. You MAY pick up or drop off loot during the Escape Phase.

**No Help Out**. You MAY NOT use Help Out during the Escape phase.

<div class="example">
<img src="../img/figure_escape.svg" class="img-right"><br>
*Example of Escape Moves*. Blue needs 5 Moves to exit: one to enter the space with a Guard, two to exit the (unsubdued) Guard, and two more moves to reach the Exit. Using his last 💡💡, he now needs to roll a 3 or higher to get out. Red and Green are Busted.
</div>

### Busted

When you are Busted, you are out of gameplay for the rest of this Heist. All loot on your character is lost. You may not be promoted for the next heist. Your Character is now in Jail, and your team may choose to rescue you in a future heist.

**Start Fresh**. Instead, you may choose an available Amateur character and two Amateur skills for the next heist. You may not choose an Amateur character of a Pro who is already on the team. The Amateur and Pro versions of a Skill card must be available for you to use as well (there are two copies of every Skill).

# Campaign

TODO: Add more here. On the campaign ledger, fill out the team name and character names. Each player gets a character sheet as well.

**Loosely Affiliated**. Players may freely come and go from the campaign. A player does is not limited to always playing their original character. All heists have 3- and 4-player options. You are always welcome to start out new characters.

**First time.** If this is your very first game, we recommend the using pre-built characters listed at the end of this booklet: Johnny Swagger, Tiny Mike, Phobia, and Showtime. Any of the Amateur heists from River City are good starters.

## Losing a Heist

Each Heist has an objective built into it. If your team does not complete its objective, you do not gain the favor of the Fixer. You still keep any loot that was taken. All players level up after a heist (see Level Up).

**Stashed away**. Even if every team member is Busted, the Team Cash and known Fixers is available for the next crew.

**Save Scumming**. You may replay a heist from your original conditions (i.e. restore from a previous "saved game").

## Winning a Heist

If you have completed your objective, you have gained the favor of that Fixer. All players level up after a heist (see Level Up).

**Sacrifices**. An objective can still be fulfilled even if some characters get Busted.

Leftover 💡 are lost. Any cash on a Character is added to the Team Cash tracker, as well as any loot. Be sure to note everything in your Campaign History.

## Level Up

**Players level up**, not just characters. Every human player starts at level 1 when they are new to this game. At the end of every heist, regardless of the objective outcome or character fate, every *player* levels up. For the next heist, a player may start with a character of the player's level (or less). That character may be new or used previously. The state of a character is still preserved between heists, for example, if a character is Busted they remain Busted for the next heist.

**Progression**. The first time you level up, upgrade one Skill card of your choice. The second time, upgrade your Character. The third time, upgrade your other Skill. The maximum player and character level is 4 (both pro Skills and a pro Character).

Each Amateur card is given two choices to level into, as indicated on the back of the card. Place your Amateur Character card in the box and choose one Pro card as your new character. Record your choice on your character sheet. Skill cards work the same way.

<div class="pagebreak"/>

# Security Reference

## Remote Locks

![remote lock](fig_hex_remote_lock_x.png)
{:.example-right .hexchit .rotate-left}

You may not enter a tile with a Remote Lock chit on it. If you are on a tile with a pressure sensor already (e.g. at the beginning of a heist), you may not ➜🔓👊📷, but you may 💡💰🔍 if actions allow it and 🔊⚠  are still required.

![remote lock](fig_hex_server-x.png)
{:.example-right .hexchit .rotate-right}

For each Remote Lock, a corresponding **Server** exists somewhere else on the board (e.g. x or y). If a character is standing on the Control Panel, then all corresponding Remote Lock rings may be immediately removed.

**TODO: MAKE A FIGURE ABOUT THIS**

## Guard Dogs

![guard dog](fig_chit_guard-dog.png)
{:.example-right .hexchit .rotate-left}

Guard Dogs are Guards. Additionally, when a Guard Dog becomes adjacent to a Character:

  1. Move the Guard Dog onto that character, and
  2. Place a Blank token over the Shield to mark that space as already Revealed (if necessary)

**Indoor creatures**. Guard Dogs do not move onto entrances/exits.

**Team optimizes ambiguity**. If ambiguity ever arises in the behavior of a Guard Dog, the team chooses. For example:

  * If a Guard Dog is added to a tile that does not already have a character and is adjacent to multiple characters, your team chooses which character the Dog jumps onto.
  * In the *Rescue Dogs* event, the team chooses who the dogs rescue in an order of your choosing.
  * In *Release the Hounds*, if the number of dogs in the bag are not equal, the team chooses how to distribute them.

## Watchtower

![watchtower](fig_hex_watchtower.png)
{:.example-left .hexchit .rotate-left}

The Watchtower is a thermal imaging system that can detect body movement across long distances. A series of Crisis cards will add Guards to locations along the path emanating from a Watchtower. A Watchtower can be disabled when a character is on that tower when the _Watchtower Sweep_ crisis occurs.

## Reinforcements

![reinforcements](fig_hex_reinforcements.png)
{:.example-left .hexchit .rotate-right}

A hex with the reinforcements token on it is freely passable initially. However, a later Crisis card will cause an area effect centered on this token.

## Lockdown Gates

![shut two gates](../img/rules/special_event_shut_two_gates.png)
{:.example-right .card-portrait}

## Keycard

![keycard lock](fig_hex_keycard-lock.png)
{:.example-right .hexchit}


**No normal lock**. Characters may not move onto a space with the Keycard Door, and only the keycard can open it. When a character who has the keycard is adjacent to the keycard door, they may remove the security token. The keycard is a form of loot.

![keycard](fig_chit_keycard.png)
{:.example-left .chit}

![keycard](fig_chit_guard.png)
{:.example-left .chit}

**Held by a Guard**. A scenario may have a keycard in the security bag. When that keycard is pulled from the security bag, **add a Guard to the revealed space** from the supply to the hex.

<div class="pagebreak"/>

# Additional Modules

These are some additional rules that come up in some scenarios.

## USB key

![usb key](fig_chit_usb-key.png)
{:.example-left .chit}

A USB key is a loot item that can go into the security bag, meaning it must be revealed to discover its location.

**Held by a Guard**. A scenario may have a USB key in the security bag. When that keycard is pulled from the security bag, **add a Guard to the revealed space** from the supply to the hex.



## Non-Player Characters

![panic](../img/rules/special_event_panic.png)
{:.example-right .card-portrait}

A **Non-Player Character** is represented by a white pawn, a white die, and their NPC card. Your team will "remotely" control the NPC.

If an NPC starts inside a Pressure Sensor, then they are not "freed" yet and effectively do not exist on the board. Immediately when the Pressure Sensor is disabled, the NPC becomes active (e.g. triggers any auto-reveals).

Follow any additional abilities or limitations described on the NPC card.

In every other way, treat an NPC like a regular character. Place their die on the action to denote that their action is taken. NPCs may carry Loot and may be given sub-actions (e.g. Script Kiddie's AUTOPWN). They Auto-Reveal, count as Characters in Security Events, and might need a die roll of their own during the Escape Phase.

NPCs all come with three actions: two Default actions and one "Roll 6" action, which is available if the NPC die rolled a 6. If an NPC has any Ideas💡, they may modify their die roll as with a regular character.

## Story Beacon

A special loot chit is the **Story Beacon**, denoted by a question mark. When a character enters a space with the Beacon for the first time, refer to the scenario for what to do, then remove the chit.

<div class="pagebreak"/>

# Pre-Built Characters

TODO: finish filling these out.

<!-- •••••••••••••••••• -->

|                                                                    |      Name      |                Character & Skills                | ➜             | 💡      | 🔍   | 🔓     | 👊  | 📷     | 🔊                    |
|:------------------------------------------------------------------:|:--------------:|:------------------------------------------------:| ------------- | ------- | ---- | ------ | --- | ------ | --------------------- |
| ![angry locksmith shadow](../img/shadows/angry locksmith.svg){:.s} | Johnny Swagger | **Angry Locksmith** <br/> Smash 'n' Grab, Bypass | ∎∎∎∎∎∎∎∎∎∎    | ∎∎∎     | ∎∎∎∎ | ∎∎     | ∎∎  | ∎∎     | ∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎     |
| ![angry locksmith shadow](../img/shadows/angry locksmith.svg){:.s} |     Karma      |     **Angry Locksmith** <br/> Hurry, Wing It     | ∎∎∎∎∎∎∎∎∎∎∎∎  | ∎∎∎∎    | ∎∎∎  | ∎∎∎    | ∎∎  | ∎∎     | ∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎  |
|            ![thug shadow](../img/shadows/thug.svg){:.s}            |    Jitters     |         **Thug** <br/> Hurry, Yank Wires         | ∎∎∎∎∎∎∎∎∎∎∎∎∎ | ∎∎∎∎∎∎∎ | ∎∎∎  | ∎      |     | ∎∎∎∎   | ∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎   |
|            ![thug shadow](../img/shadows/thug.svg){:.s}            |   Tiny Mike    |          **Thug** <br/> Wing It, Bypass          | ∎∎∎∎∎∎∎∎∎∎∎   | ∎∎      | ∎∎   | ∎∎∎∎∎∎ | ∎∎  | ∎∎     | ∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎   |
|   ![street urchin shadow](../img/shadows/street urchin.svg){:.s}   |     Enigma     |      **Street Urchin** <br/> Hurry, Bypass       | ∎∎∎∎∎∎∎∎∎∎∎∎∎ | ∎∎∎∎∎∎  | ∎    | ∎∎∎∎∎  |     |        | ∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎     |
|   ![street urchin shadow](../img/shadows/street urchin.svg){:.s}   |    Iceheart    |   **Street Urchin** <br/> Wing It, Yank Wires    | ∎∎∎∎∎∎∎∎∎∎∎   | ∎∎∎     | ∎∎∎∎ | ∎∎     | ∎∎  | ∎∎∎∎∎∎ | ∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎ |
|   ![script kiddie shadow](../img/shadows/script kiddie.svg){:.s}   |     Phobia     |  **Script Kiddie** <br/> Smash 'n' Grab, Bypass  |               |         |      |        |     |        |                       |
|   ![script kiddie shadow](../img/shadows/script kiddie.svg){:.s}   |      Null      |    **Script Kiddie** <br/> Hurry, Yank Wires     |               |         |      |        |     |        |                       |
|         ![burglar shadow](../img/shadows/burglar.svg){:.s}         |    Showtime    |        **Burglar** <br/> Bypass, Wing It         |               |         |      |        |     |        |                       |
|         ![burglar shadow](../img/shadows/burglar.svg){:.s}         |     Clutch     |   **Burglar** <br/> Smash 'n' Grab, Yank Wires   |               |         |      |        |     |        |                       |
|         ![lookout shadow](../img/shadows/lookout.svg){:.s}         |   Crazy Eyes   |         **Lookout** <br/> Hurry, Wing It         |               |         |      |        |     |        |                       |
|         ![lookout shadow](../img/shadows/lookout.svg){:.s}         |     Smokes     |     **Lookout** <br/> Smash 'n' Grab, Bypass     |               |         |      |        |     |        |                       |
|      ![pickpocket shadow](../img/shadows/pickpocket.svg){:.s}      |     Status     |      **Pickpocket** <br/> Hurry, Yank Wires      |               |         |      |        |     |        |                       |
|      ![pickpocket shadow](../img/shadows/pickpocket.svg){:.s}      |     Locket     | **Pickpocket** <br/> Hit 'n' Run, Smash 'n' Grab |               |         |      |        |     |        |                       |
|     ![shutter bug shadow](../img/shadows/shutter bug.svg){:.s}     |     F-Stop     |      **Shutter Bug** <br/> Wing It, Bypass       |               |         |      |        |     |        |                       |
|     ![shutter bug shadow](../img/shadows/shutter bug.svg){:.s}     |    Stretch     |     **Shutter Bug** <br/> Hurry, Hit 'n' Run     |               |         |      |        |     |        |                       |
{:.prebuilt}

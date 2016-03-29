Project Timber Wolf
===================

Working title for a cooperative heist game.

The main mechanics of this game are:
  * Cooperative
  * Action programming
  * Economy
  * Characters and experience
  * Roguelike: permadeath, generated maps


Objective
---------

The objective of the game will be to win a certain amount of cash overall by the end of a certain number of heists. I'm anticipating these heists to take around 15 minutes each, and three heists is what you could reasonably fit in.

However, there's a longer campaign version of this that requires on the order of a dozen heists that need to be pulled. Players can stop and start their sessions easily.


Gameplay
--------

You're planning a heist on a board with a lot of small hex tiles. These tiles represent rooms that all have different obstacles.

You'll plan a heist that can go in a lot of different directions, so you'll need to plan for contingencies. The heist phase is purely mechanical - except for specific actions where players communicate with each other.

For each heist, you set up the board, choose your characters, and then decide upon their "plan". The plan is a deck of actions that you stack into a deck, and it represents the behavior of how the player act in a given situation. The plan deck will go into an infinite loop with no change in order of the actions. As characters get more experience and upgrade over time, they get bigger decks, more powerful choices, and have better contingency options.

Contingency plans are face-up cards sitting in front of the player that represent what the player will do when an event happens.

There's also a "move" deck that represents the path a character will take into the heist. When a player does a "move" action, they reveal the next card off their move deck.

Players can train their characters to have special abilities, and then program their behavior around that.

Players can also do a certain amount of reconaissance, but that costs money too.

BUT, there's also a D20 that you roll that changes the situation slightly so that things never really go according to plan. Heists have 1-20 sets of guard actions that can happen, so there's a lot of stuff that can happen.

Maybe everyone does an action, then the guards do an action that is based on noise level and disturbed rooms - i.e. if they notice a disturbed room, noise level gets to high, or surveillance picked something up. Roll a die for them too. The alarm gets raised based on noise + disturbed rooms next to each other + surveillance + # guards

And then every time someone does an action, they get better at it no matter what. That gets recorded on their character sheet. Moving doesn't level you up, but picking locks, self-defense, attacking, hacking, explosives,

Recon actions:
  * Find the loot
  * Copy the master key
  * Hack the security systems
  * Bribe a guard
  * Discover rooms
  * Tunnel - raises noise level, disturbs initial room

Issues:
  * Noise level - this goes up incrementally, and sets off the alarm if it gets to a certain amount
  * Disturb room - if you do something and a guard notices later, the alarm gets sounded

Ideas for actions:
  * Move to a new tile (draw your card off the move deck)
  * Pick locks - quiet, can get lucky but takes a few tries, but you can get better
  * Communicate with players (can be used to transfer key pieces of information and stuff.)
  * Leave note for next player (disturbs room, transfers knowledge)
  * Stash loot? Maybe loot get auto-stashed when you first get there - or maybe that's a character ability. Stashing has to help you somehow.
  * Hack surveillance
  * Crouch and move (good for attacking guards, quiet)
  * Set trap for guards - quiet, no disturbance
  * Set up explosives, trigger explosives
  * Adrenaline rush: do two more actions, but noise level automatically goes up
  * Sprint: move twice, but if you hit a locked door the noise level goes up

Contingency situations
  * When the alarm is raised... (backtrack - go through your move pile in reverse now, or disguise as a guard)
  * When you get the loot...
  * If you killed a guy...
  * When you talk to someone else...
  * When you encounter a guard...

Room types:
  * Guards
  * Loot
  * Surveillance
  * Locked doors
  * Noisy room
  * Empty (provides line of sight!)

Character ideas:
  * Disgruntled Locksmith - picks locks really well, kinda noisy, bad self-defense
  * Grease Man - very quiet, picks locks decently, good with explosives,
  * Special Forces - good self-defense, but often kills, quiet, bad at picking locks, good at explosives
  * Mastermind - communication saves you somehow
  * Grifter - not quiet, but self-defense is crazy good, almost never kills, when alarm is raised he can now be disguised as a guard
  * Mole Man - good at explosives and tunneling, smash-and-grab kind of guy


Example Action Card: Pick Locks
  * Roll your D20. Add your experience with picking locks to the roll. Here are the potential outcomes
  * Every time you do this action, you gain 1 experience with it.
  * 1     FAIL. LOSE PICKS. Remove from plan. Disturb room. Experience +3
  * 2     FAIL. BREAK PICKS. Remove from plan. Experience +2
  * 3-4   FAIL. ACHOO. Noise +1
  * 5-6   FAIL. FRUSTRATED. Move on to next card
  * 7-9   FAIL. PERSEVERE. Repeat this card next turn.
  * 10-12 SUCCESS. DOOR LEFT OPEN!! Disturb room.
  * 13-15 SUCCESS! CREEEEAK!!! Noise +1
  * 16-17 SUCCESS! LEARNED A LOT. Experience +1
  * 18    SUCCESS! BYPASSED! All lock picks are automatic successes this heist.
  * 19    FAIL. LEARNED A LOT. Experience +3
  * 20    SUCCESS. LEARNED A LOT. Experience +3

Ending the Game
---------------



=== Latest Brain Dump ===

# Skills
Get attached to each player. Each character has four corners that support four kinds of actions: locks, guards, move, and network.

## Locked Doors
Brute Force - free, loud, disturbs
Cut Locks - cheap, disturbs or is loud
Rake Lock - quiet, low success rate.
Pick Lock - high success rate, expensive, has some bonus loots possibilities
Grift - convince someone to do it. Low success rate, but no noise or disturbs room.

## Guards
Self Defense - loud, disturbs room, no cost
Ambush - good for lots of guards, loud, high success
Sneak Attack - good for few guards, quiet, no disturbs
Grift - stay in room, takes up time. Can't be used on alarm.
Sneak By - quiet, does nothing to guards. Can't be used on alarm.

## Move
Walk - free, balanced between noisy/fast and slow/quiet.
Creep - Mostly slow, quiet and not disturbing.
Sprint - fast, noisy, no recon while moving

## Network
Rip Wires - disturbs, but lowers alertness
Sniff Packets - recon on any tile
Loop Cameras - lowers alertness, but low success rate.
Unlock Doors - potentially has noise
Denial of Service - delays alarm for one turn.
False Alarm - lowers noise
Recover schematics - uncover security tiles

## Special actions
Grift - can be put in any slot, only open to Con Artists and Masterminds, does nearly everything. No +EXP rolls on it so you are at its mercy. Some actions just get you loot (pickpocket).

## Characters

***n00b***
***Angry Coder***
***Hacktivist***
***Script Kiddie***
***Black Hat***
Brings two Network cards with him (or maybe a special one just for him). More experience on networks. Cannot do anything with guards. Different classes allow different abilities. Good planning memory. Low picking ability.

***Disgruntled Locksmith***
***Safecracker***
Better lock picking skills for cheap. More experience on locks. Poor planning memory. Good network capacity. Only walk for move abilities.

***Thug***
***Bag Man***
***Operative***
***Persuasion Specialist***
Good moving experience. Great planning memory. Good attack ability maximum.

***Mastermind***
***Evil Genius***
Great planning memory. Grift abilities. Can change one teammates plan per turn (move one token).

***Street Urchin***
***Con Artist***
Grift abilities. Otherwise balanced. Great planning memory.


***Burglar***
***Thief***
***Grease Man***
Great movement. Good attack. No network abilities.  Can have an extra movement or attack. Good planning memory.

 **** Character Leveling ****
* After each heist, you get money. With enough money, you can turn one character into another. There's a tech tree lattice to this.
* Each card can become a better version of itself. Or jump over to another one. For example: Lock pickers --> Planners --> Hackers --> Movers --> Muscle --> Lock Pickers.
* Skills can be kept even if the crew leaves. Skills are bought Skills can also be transferred. New skill are cheaper if you have the prior one.



Have exp be per ability. That way you have a reason to use all of them. Or maybe allow it to be general? Not sure about this one.

*Game order*. Everyone Roll. Put your die and modify it on the action card. Then everyone do the move. This means recon info can't be used simultaneously. Then roll for guards.

## Objectives
  * Get money from loot tiles.
  * Get one item. Get keys first then get item.
  * Capture prisoner. Alarm goes off as soon as you capture him.
  * Another objective idea, using square chits: steal paintings. The paintings of the same artist will combine for more money, but also can be sold individually.

+++Map Tiles+++
Open tile - nothing on it, some have network access?
Security tile - could be guards or locks. Decided by chits.
Server tile - has access to the network
Drop wall - impassable once the alarm sounds.
Loot tile - has money, decided by chits.
Key tile - has a key chit on it, open  
Destination tile - has the macguffin, decided by objective
Entry/Exit point tiles
Exit-only tiles
Entry-only tiles

# Maybe one side of the tiles are "advanced" or something. Ones with a different color scheme.

+++Maps+++
Tile arrangement.
Number of guards, locks, and empty security chits.
Alert level for alarm
Name and flavor text

+++Chits+++
Security chits:
  Guards: one or two guards.
  Locks: just a lock.
  Security wall - dropped after alarm goes off
  Need subdued guards chits
  Need opened lock chits
Loot chits: different amounts of money to be revealed
Macguffin chits - nothing to reveal
Macguffin key chits - nothing to reveal

# Allow for recon to be paid for at the beginning? Would need a rising cost of recon so you have to target

# When players are in the same space, they can use each other's rolls. That might be OP but we should give an advantage to being I the same spot. Or maybe swap dice instead?

+++Map Design Ideas+++
* Put the server behind lots of security chits and have lots of guards in the mix.
* Have a long open stretch that snakes around but takes a long time. Get a prisoner so it's hard to get out.
* Drop walls trap you in so you have to go forward.
* Put the entrance in the beginning, server easy to get to, but then the exit on the other side
* Split hallways so you have to choose. Put two or three security tiles on each and you're bound to have to deal with both kinds. Makes it better for balanced characters but tougher for specialists.
* Multiple entries and exits vs singles.
* Long hallways for really tough ones.

+++Guard Mechanic+++
* Add alertness for each PAIR of disturbed rooms. Maybe one for each and one for each pair.
* Noise levels will increase alertness rapidly
* Add alertness for each number of subdued guards. Increases rapidly.!
* Roll somehow? Don't want to make the game to be all about screwage here.

+++Alarm+++
* Only move is allowed
* Roll for each player. There's a chance for capture for each player.
* When a player is captured, they must lose some turns at the beginning of the next heist, or you can pay money to free them.
* If all players are captured, the heist is lost and the game is over.
* Basically, the longer you linger after an alarm, the harder it is to win.
* Still have to stick to the track you planned.

+++Prep Moves+++
* Set up board
* Buy recon
* Choose characters
* Buy abilities for characters
* Plan movement (place winks)

+++Strategies+++
* Pave the way. Get a lock picker and muscle to walk through and clear out. Then sprint in and out.
* Sacrifice a hacker. Get the hacker into the server room and delay as long as you can. Leave him and bail.
* Smash and grab. Get multiple thieves and sprint the whole way there. Get out quick.
* Grifter pack. Bring a few people together in a pack and get the grifter to do what you need by swapping/using dice.  
* Planner team. Place movement all over and use recon to your advantage. Good when there's a lot of blanks but you don't know where they are. Dodge mostly, but then trigger noise if you need to.

# Hook: a cooperative heist game where you have to plan, and then live with that plan. Program a team of characters with diverse capabilities by arming each with special skills, such as lock picking, sneak attacks, hacking, and the old fashioned grift. Heists are short (about 15-20 minutes), and a standard game is three heists. But, there are longer campaigns with 12 heists and an emergent storyline with character arcs. Modular hex-tile board. Dice but with adjustments. What's not to like??

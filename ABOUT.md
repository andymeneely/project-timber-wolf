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

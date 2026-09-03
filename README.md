# The Shadow

> A 2D dark-fantasy action platformer built with Godot 4.

[Türkçe README](README_TR.md)

## Overview

**The Shadow** is a 2D action-platformer project focused on responsive combat, exploration, enemy encounters, checkpoints, progression and boss combat. The project was developed in **Godot 4** with **GDScript**, with AI-assisted development used as part of the implementation and iteration workflow.

The game combines pixel-art environments with a dark fantasy atmosphere and multiple gameplay areas. Its combat systems include player health and energy management, standard enemies with autonomous behavior, and a boss encounter with a more specialized behavior set.

## Gameplay Showcase

### Main Menu
![The Shadow main menu](screenshots/main-menu.png)

### Exploration & Combat
![Castle gameplay](screenshots/castle-gameplay.png)

![Village gameplay](screenshots/village-gameplay.png)

![Burning area gameplay](screenshots/burning-area.png)

### Boss Encounter
![Boss encounter](screenshots/boss-encounter.png)

The boss uses dedicated combat behavior, including player pursuit, attacks, a freeze mechanic and teleport-style repositioning around the player. Standard enemies also use gameplay AI to detect, pursue and engage the player.

### Game States
![Boss defeated](screenshots/boss-defeated.png)

![Player death screen](screenshots/death-screen.png)

## Key Features

- 2D action-platformer gameplay
- Multiple pixel-art environments and gameplay areas
- Player health and energy systems
- Melee/action combat mechanics
- Standard enemy AI with detection, pursuit and combat behavior
- Boss AI with specialized attacks and movement behavior
- Boss teleport/repositioning around the player
- Player-freeze mechanic used during the boss encounter
- Checkpoint and respawn flow
- Save/continue support
- Attempt/life handling and death state
- Shop/gameplay support systems
- Main menu with New Game, Continue and Quit flow
- Win/boss-defeat state

## Enemy & Boss AI

Enemy behavior is not limited to static animation or scripted placement. Standard enemies contain autonomous gameplay behavior used to react to the player and participate in combat encounters.

The boss encounter expands this concept with a dedicated set of behaviors. The boss can pursue the player, execute specific attacks, temporarily freeze the player and reposition/teleport within the surrounding combat area. These mechanics create a more dynamic encounter than the standard enemies.

## Game Flow

The project includes a main-menu flow with **New Game**, **Continue** and **Quit** options. During gameplay, the player progresses through different environments, encounters enemies, uses checkpoints and eventually reaches the boss encounter. Defeat and boss-completion states provide dedicated game-state screens.

## Technical Highlights

| Area | Implementation |
|---|---|
| Engine | Godot 4 |
| Language | GDScript |
| Genre | 2D Action Platformer |
| Art direction | Pixel-art / Dark Fantasy |
| Enemy systems | Detection, pursuit and combat behavior |
| Boss systems | Specialized AI, pursuit, attacks, freeze and teleport behavior |
| Progression | Checkpoints, respawn and save/continue flow |
| Supporting systems | Shop and gameplay managers |

## Project Structure

The repository contains the Godot project configuration and gameplay scripts. Important support scripts include checkpoint handling, game-state management and save management, alongside player/enemy/boss and gameplay-specific scripts.

```text
project.godot
scripts/
  checkpoint.gd
  game_manager.gd
  save_manager.gd
area_2d.gd
blue.gd
shop.gd
screenshots/
```

## Running the Project

1. Install a compatible **Godot 4.x** version.
2. Clone or download this repository.
3. Open Godot Project Manager.
4. Import the folder containing `project.godot`.
5. Open the project and run it from the Godot editor.

## Development Notes

This repository is presented as a portfolio project demonstrating practical experience with Godot, GDScript, gameplay programming, state management and enemy/boss behavior design. AI-assisted development tools were also used during development as part of the coding and iteration workflow.

## Current Project Status

The core game project runs and the main gameplay systems are implemented. One known incomplete area is **teleportation/transition between some maps**, which still requires additional integration work.

## Developer

**Mustafa Alajati**  
Software Developer · Business Automation · AI-Assisted Development · Godot 4

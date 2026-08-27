# 🌑 THE SHADOW

<p align="center">
  <b>English</b> | <a href="README_TR.md">Türkçe</a>
</p>

![Godot](https://img.shields.io/badge/Godot-4.6-478CBF?logo=godot-engine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-Gameplay%20Systems-478CBF)
![Genre](https://img.shields.io/badge/Genre-2D%20Action%20Platformer-black)
![Development](https://img.shields.io/badge/Development-AI--Assisted-6f42c1)
![Status](https://img.shields.io/badge/Status-Playable%20Portfolio%20Build-success)

**THE SHADOW** is a 2D action-platformer built with **Godot 4.6** and **GDScript**. It is a systems-focused game project combining responsive platforming, directional combat, enemy AI, a boss encounter, traps and moving platforms, checkpoints, persistent save/continue logic, rune-based progression, an ability shop, animated UI, and environmental transitions.

The project was developed iteratively as a practical game-development study. **OpenAI Codex** was used as an AI-assisted development tool for debugging, implementation support, code iteration, and workflow acceleration, while gameplay design, scene integration, testing, balancing decisions, and overall project direction remained part of the development process.

> **Current development state:** the portfolio build opens and runs successfully in Godot. Core gameplay systems are playable. The multi-map portal/teleport flow exists in the project but is still being refined and is not presented as fully complete.

## 🎮 Game Overview

The core loop is built around exploring 2D platforming environments, fighting enemies, avoiding environmental hazards, activating checkpoints, collecting runes from defeated enemies, and using progression systems to unlock additional movement abilities.

The project is organized around reusable Godot scenes and scripts rather than a single monolithic controller. Player mechanics, enemies, checkpoints, hazards, UI, shop logic, persistence, portals, and environmental systems are separated into dedicated components.

## 🧍 Player Movement & Character Controller

The main player controller uses `CharacterBody2D` and implements:

- Smooth horizontal movement with acceleration instead of instant velocity changes
- Ground friction and separate lower air friction
- Gravity-based jumping and platforming
- Character facing based on movement direction
- Context-sensitive animation switching for idle, movement, jumping, attacking, dash, damage, and death states
- Normal dash in the current facing direction
- Ground dash dust / visual feedback
- Knockback reactions when receiving damage
- Temporary invincibility / hit-state handling
- Respawn positioning tied to checkpoints

### Dash System

The player has two different dash mechanics:

**Standard Dash**
- Available as a core movement ability
- Direction follows the player's current facing direction
- Temporarily overrides normal horizontal movement
- Supports dedicated dash animation and dust feedback

**Special Dash**
- Starts locked and is unlocked through the in-game shop
- Uses a separate higher-speed dash state
- Supports up to **3 charges**
- Charges are consumed individually
- Charges recharge over time after being depleted
- The HUD updates to represent available Special Dash charges

## ⚔️ Combat System

Combat is collision-driven using `Area2D` and `CollisionShape2D` attack zones.

### Directional Attacks

The player supports three attack directions:

- **Front Attack** — primary ground/air attack
- **Up Attack** — launches the player upward when used from the ground and attacks vertically
- **Down Attack** — available while airborne for downward combat

The attack area changes orientation based on the player's facing direction and selected attack type.

### Combo Logic

The front attack includes a timed combo window:

- The first attack opens a short combo opportunity
- A second attack input during the valid window requests the next combo action
- Attack state, combo state, and collision timing are managed separately to prevent invalid overlapping attacks

### Damage & Player States

The character system includes:

- 3-point health system
- HUD health feedback
- Damage reactions
- Knockback
- Invincibility state handling
- Death state
- Death menu integration
- Checkpoint-based respawn
- Freeze status effect with blue visual tint and particles
- Freeze animation feedback and timed recovery

## 👾 Enemy & Boss Systems

The original project contains multiple enemy implementations with different combat behavior rather than one duplicated enemy controller.

### Standard Enemy

The base enemy behavior includes:

- Player detection / target tracking
- Attack range logic
- Timed attack hit
- Damage reception
- Hit knockback
- Death animation/state
- Rune reward on defeat

### Skeleton

The Skeleton enemy adds:

- Patrol-style movement
- Edge/wall awareness
- Player-facing behavior during encounters
- Close-range timed attack
- **3 health** by default
- Damage and hit-reaction states
- Rune reward when defeated

### Wizard

The Wizard is a stronger enemy with:

- Edge/wall-aware movement logic
- Player-facing combat behavior
- Alternating `attack` and `attack2` animations
- Attack IDs to prevent outdated delayed attacks from incorrectly landing
- **5 health** by default
- **2 damage** per configured attack
- Higher rune reward than standard enemies

### Guard

A dedicated Guard controller is included for another enemy/navigation behavior, with movement and turn/wait logic separated from the Skeleton and Wizard implementations.

### BLUE Boss Encounter

The project also includes a dedicated boss controller named **BLUE** with a more advanced state machine:

- **15 health** by default
- Player detection and facing
- Distance-based decision making
- Dash/chase behavior when the player is far enough away
- Two randomized attack types
- Separate damage values for Attack 1 and Attack 2
- Attack hit timing and collision windows
- One attack can apply the player's freeze status effect
- Boss hit reaction and damage handling
- Teleport-away behavior within the encounter logic
- Death handling
- Dedicated boss-health UI synchronization

Additional boss presentation components include:

- Boss introduction overlay / fade animation
- Boss name display
- Boss health bar
- Runtime health updates

## 💎 Rune Economy & Ability Progression

The `GameManager` maintains a lightweight rune/coin progression system.

Enemies can award runes when defeated. Those runes are displayed through a dedicated Rune UI and can be spent at an interactive shop.

### Shop System

The shop includes:

- Player proximity detection
- `E`-key interaction
- Open/close shop UI
- Ability name and configurable cost
- Insufficient-rune feedback
- Already-purchased feedback
- Purchase validation through `GameManager`

The implemented purchasable ability is **Special Dash**, which changes the player's available movement mechanics after purchase.

## ❤️ HUD & Gameplay Feedback

The game contains several UI systems for runtime feedback:

- Health display / hearts
- Health fill interface
- Special Dash charge display
- Rune counter
- Death menu
- Interactive message UI
- Transition UI
- Boss introduction UI
- Boss name and boss health bar

The health and dash interfaces update from gameplay state instead of being static visual elements.

## 💾 Checkpoints, Save & Continue

Progress persistence is handled through a dedicated autoloaded `SaveManager`.

Checkpoint activation stores:

- Current scene path
- Checkpoint world position
- Whether a valid checkpoint exists

Data is written using Godot's `ConfigFile` to:

```text
user://save_game.cfg
```

### Continue Flow

The main menu includes:

- New Game
- Continue
- Quit
- Animated menu entrance
- Button hover animation

When a save exists, the Continue flow loads the stored scene and restores the player's saved checkpoint position.

## 🚩 Checkpoint & Respawn Flow

Checkpoint scenes use trigger detection to activate only once, update the player's respawn position, save the current scene/position through `SaveManager`, and play checkpoint animation feedback.

Player death opens the death UI and respawn restores:

- Player position
- Full health
- Movement/combat states
- Freeze state
- Attack collision state
- Character animation state

## 🌍 Levels, Portals & World Progression

The source project includes multiple level scenes, including the main game scene and later-level scenes such as `level_2`, `level_3_new`, and `level_4`.

### Portal / Transition Architecture

Portal logic is implemented with:

- Player proximity detection
- `E` interaction
- Portal activation animation
- Transition screen
- Progressive word-by-word transition text
- Animated trailing dots
- Confirmation state before scene change
- `PackedScene` target assignment
- Godot scene switching through `change_scene_to_packed()`

**Development note:** the portal/teleport architecture is present, but the connection between every map is still being completed/refined. This is an existing game-development TODO, not a problem introduced by the GitHub portfolio cleanup.

## 🌅 Environmental Progression

A `day_night_controller.gd` system changes the level atmosphere based on the player's horizontal progress.

It interpolates a `CanvasModulate` from a brighter morning color toward an evening color as the player moves from the configured level start toward the level end. This creates environmental progression without requiring a real-time clock system.

## ⚠️ Hazards & Interactive World Objects

The source project includes multiple gameplay/environment scripts for:

- Spike damage
- Kill zones / instant-death areas
- Saw traps
- Level-specific saw trap variants
- Fire objects and level-specific fire implementations
- Moving platforms
- Up/down moving platforms
- Boxes / environment objects
- Houses / scene decorations
- Signs and player messages
- Portal decoration
- Spawn points

These systems are separated into reusable scene scripts so they can be placed across different levels.

## 🕹️ Default Controls

| Action | Key |
|---|---|
| Move Left | Left Arrow |
| Move Right | Right Arrow |
| Jump | Space |
| Front Attack | Z |
| Up Attack | Up Arrow |
| Down Attack | Down Arrow |
| Dash | C |
| Special Dash | X |
| Interact / Portal / Shop | E |

## 🧰 Technology & Godot Features

| Technology / Feature | Usage |
|---|---|
| Godot 4.6 | Game engine |
| GDScript | Gameplay and system scripting |
| CharacterBody2D | Player and character movement |
| Area2D | Combat, detection, checkpoints, hazards, interaction zones |
| CollisionShape2D | Runtime hitboxes and trigger collisions |
| AnimatedSprite2D | Character, enemy, portal and environment animation |
| GPUParticles2D | Freeze / gameplay visual feedback |
| ConfigFile | Persistent save/checkpoint storage |
| Autoload | Global `SaveManager` persistence |
| Tween | Menu and boss-introduction UI animation |
| CanvasModulate | Progress-based environmental lighting/color transition |
| PackedScene | Portal/level target references |

## 🏗️ Source Project Organization

The full Godot source package contains approximately **47 GDScript files** and **30 `.tscn` scenes**. Key systems include:

```text
project.godot
scripts/
├── character_body_2d.gd
├── enemy.gd
├── skeleton.gd
├── wizard.gd
├── guard.gd
├── checkpoint.gd
├── save_manager.gd
├── game_manager.gd
├── shop.gd
├── rune_ui.gd
├── health_dash_ui.gd
├── main_menu.gd
├── death_menu.gd
├── portal_exit.gd
├── transition_ui.gd
├── day_night_controller.gd
├── killzone.gd
├── saw_trap.gd
├── spike.gd
├── platform.gd
└── ...

secnes/
├── game.tscn
├── level_2.tscn
├── level_3_new.tscn
├── level_4.tscn
├── character_body_2d.tscn
├── enemy.tscn
├── skeleton.tscn
├── wizard.tscn
├── boss_intro.*
├── boss_ui.*
└── ...
```

> The existing folder name `secnes/` is intentionally preserved because Godot resources already reference it. Renaming it without updating every `res://` reference would risk breaking scene/resource links.

## 🤖 AI-Assisted Development with Codex

OpenAI Codex was used during development as an engineering assistant, primarily for:

- Debugging GDScript behavior
- Iterating gameplay logic
- Investigating scene/script integration problems
- Refactoring and improving individual systems
- Accelerating experimentation during development

This is presented as **AI-assisted development**, not as autonomous game creation. The project still required gameplay decisions, Godot scene construction, integration, tuning, testing, and manual iteration.

## 🚀 Running the Project

1. Install **Godot 4.6** or a compatible Godot 4.x build.
2. Clone/download the project.
3. Open Godot Project Manager.
4. Import `project.godot`.
5. Allow Godot to process/import assets if needed.
6. Run the project with **F6/F5 / Run Project**.

```bash
git clone https://github.com/safialajati2-creator/the-shadow-game.git
cd the-shadow-game
```

Configured main scene:

```text
res://secnes/game.tscn
```

## ✅ Verification & Current Status

During portfolio preparation:

- The original Godot ZIP was inspected as a source project rather than an exported executable.
- `project.godot` was verified.
- The configured main scene was identified.
- 47 GDScript files and 30 scene files were identified in the original project package.
- Static `res://` resource references were checked against the cleaned package with no missing referenced file paths found in that scan.
- Generated/cache material was separated from source files conservatively.
- The cleaned portfolio copy was imported and run successfully in Godot on the developer's machine.
- The known map-to-map teleport/portal completion work remains an existing development item.

## 🎨 Assets & Credits

The project contains game-development assets, fonts, audio, custom/generated artwork, and third-party asset packs used during development. Any original license documents and usage terms remain applicable to their respective assets.

This repository is presented as a **game-development and software-engineering portfolio project**.

## 🎯 What This Project Demonstrates

THE SHADOW demonstrates practical experience with **Godot 4, GDScript, player controllers, platformer physics, directional combat, combo logic, collision-driven hit systems, enemy AI, boss behavior, state management, status effects, checkpoints, persistence, UI/HUD systems, progression economy, ability unlocking, environmental effects, level integration, debugging, and AI-assisted development workflows**.

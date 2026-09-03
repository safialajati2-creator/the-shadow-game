# 🌑 THE SHADOW

<p align="center">
  <strong>A 2D dark-fantasy action platformer built with Godot 4.6 and GDScript</strong>
</p>

<p align="center">
  <a href="README_TR.md">Türkçe</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Godot-4.6-478CBF?logo=godot-engine&logoColor=white" alt="Godot 4.6">
  <img src="https://img.shields.io/badge/GDScript-Gameplay%20Systems-478CBF" alt="GDScript">
  <img src="https://img.shields.io/badge/Genre-2D%20Action%20Platformer-black" alt="Genre">
  <img src="https://img.shields.io/badge/Game%20AI-Enemy%20%26%20Boss%20Behaviors-6f42c1" alt="Game AI">
  <img src="https://img.shields.io/badge/Status-Playable%20Portfolio%20Build-success" alt="Status">
</p>

## About the Game

**THE SHADOW** is a systems-focused 2D action-platformer combining responsive movement, directional combat, behavior-based enemy AI, a dedicated boss encounter, checkpoints, persistent save/continue logic, rune progression, an ability shop, hazards, UI feedback, and multiple pixel-art environments.

The project was built in **Godot 4.6** with **GDScript**. OpenAI Codex was used as an AI-assisted engineering tool during development for debugging, implementation support, code iteration, and workflow acceleration. Gameplay design, scene construction, integration, testing, balancing decisions, and overall project direction remained part of the development process.

> **Current development state:** the portfolio build opens and runs successfully in Godot. Core gameplay systems are playable. The multi-map portal/teleport architecture exists, while some map-to-map connections are still being refined.

## 🎮 Gameplay Showcase

### Main Menu

<p align="center">
  <img src="docs/images/main-menu.png" alt="THE SHADOW main menu" width="900">
</p>

The game includes a complete menu flow with **New Game**, **Continue**, and **Quit**, supporting persistent checkpoint-based progression.

### World Exploration

<table>
  <tr>
    <td width="50%"><img src="docs/images/castle-level.png" alt="Castle level gameplay"></td>
    <td width="50%"><img src="docs/images/village-level.png" alt="Village level gameplay"></td>
  </tr>
  <tr>
    <td align="center"><strong>Castle Area</strong></td>
    <td align="center"><strong>Village Area</strong></td>
  </tr>
</table>

<p align="center">
  <img src="docs/images/burning-area.png" alt="Burning area gameplay" width="900">
  <br><strong>Burning Area</strong>
</p>

The levels use distinct environments and gameplay spaces while reusing common systems such as enemies, hazards, moving objects, checkpoints, UI, and player controls.

## ⚔️ Player Movement & Combat

The player controller uses `CharacterBody2D` and includes:

- Acceleration-based horizontal movement instead of instant velocity changes
- Ground friction and separate air-friction behavior
- Gravity-based jumping and platforming
- Direction-aware character facing and animation states
- Standard dash with dedicated movement state and visual feedback
- Unlockable **Special Dash** with higher speed, up to **3 charges**, consumption and timed recharge
- Dynamic HUD synchronization for health and dash state
- Knockback, temporary invincibility, damage and death states
- Checkpoint-based respawn
- Freeze status handling with visual feedback and timed recovery

### Directional Combat

Combat is driven by `Area2D` and `CollisionShape2D` attack zones and supports:

- Front attacks
- Upward attacks
- Airborne downward attacks
- Direction-aware attack hitboxes
- Timed combo windows for chained attacks
- Separate attack, combo and collision states to prevent invalid overlapping hits
- Damage, knockback and hit-reaction handling

## 🧠 Behavior-Based Enemy AI

Enemies are not static obstacles. The project uses **game AI / behavior-based decision logic** so enemies can react to the player and environment. This is gameplay AI rather than machine-learning AI.

A typical enemy decision flow is:

**Detection → Target Tracking → Facing / Movement → Range Evaluation → Attack Decision → Attack Timing → Damage / Death State**

### Standard Enemy

- Player detection and target tracking
- Attack-range evaluation
- Timed attack hits
- Damage and knockback handling
- Death state and rune reward

### Skeleton

- Patrol-style movement
- Edge and wall awareness
- Player-facing behavior during encounters
- Timed close-range attack
- **3 health** by default
- Hit reactions and rune reward

### Wizard

- Edge/wall-aware movement
- Player-facing combat behavior
- Multiple attack animations (`attack` / `attack2`)
- Attack variation
- Attack-ID logic to prevent outdated delayed attacks from landing incorrectly
- **5 health** by default
- Configured attacks can deal **2 damage**
- Higher rune reward than standard enemies

### Guard

The Guard uses a dedicated controller with separate movement, waiting, turning, and navigation behavior rather than reusing the Skeleton or Wizard controller.

## 👑 BLUE — Adaptive Boss Encounter

<table>
  <tr>
    <td width="50%"><img src="docs/images/boss-intro.png" alt="BLUE boss introduction"></td>
    <td width="50%"><img src="docs/images/boss-encounter.png" alt="BLUE boss encounter"></td>
  </tr>
  <tr>
    <td align="center"><strong>Boss Introduction</strong></td>
    <td align="center"><strong>Boss Encounter</strong></td>
  </tr>
</table>

**BLUE** has a dedicated behavior/state system that reacts to the player's position and distance instead of repeating a single fixed action sequence.

### Boss AI & Decision Making

- Player detection and target tracking
- Continuous facing toward the player
- **Distance-based action selection**
- Dash/chase behavior when the player is far away
- Attack behavior when the player enters combat distance
- Two randomized attack types
- Separate attack damage values and timed hit windows
- Damage, hit-reaction and death states
- Dedicated boss-health UI synchronization
- **15 health** by default

Conceptually, the boss follows:

**Track Player → Measure Distance → Choose Chase / Dash / Attack → Execute Timed Action → Re-evaluate Player Position**

### ❄️ Freeze Mechanic

One of BLUE's attacks can apply a **Freeze** status effect to the player. The player controller enters a temporary frozen state, displays dedicated visual feedback, and recovers after a configured duration. This connects the boss combat logic directly with the player's status/state system rather than treating every boss hit as simple health damage.

### ⚡ Arena Repositioning / Teleport

BLUE can reposition between **predefined teleport points inside the boss arena**. The player's current position is used as part of the positioning logic, allowing the encounter to change spacing and force the player to react to a new combat situation.

## 💎 Rune Economy & Ability Shop

Defeated enemies can award runes. `GameManager` tracks the rune economy and a dedicated UI displays the current amount.

The interactive shop supports:

- Player proximity detection
- `E` interaction
- Open/close shop UI
- Configurable ability cost
- Insufficient-rune feedback
- Already-purchased validation
- Purchase processing through `GameManager`

The implemented purchasable ability is **Special Dash**, expanding the player's movement options after purchase.

## ❤️ HUD & Gameplay Feedback

Runtime UI systems include:

- Health / heart display
- Health fill UI
- Special Dash charge display
- Rune counter
- Death menu
- Interactive messages
- Transition UI
- Boss intro presentation
- Boss name and health bar

These interfaces update dynamically from gameplay state rather than serving as static visuals.

## 💾 Checkpoints, Save & Continue

Progress persistence is handled by an autoloaded `SaveManager` using Godot `ConfigFile`.

Checkpoint activation stores:

- Current scene path
- Checkpoint world position
- Whether a valid checkpoint exists

Save data is written to:

```text
user://save_game.cfg
```

The **Continue** flow loads the stored scene and restores the saved checkpoint position. Respawn restores player position, health, movement/combat state, freeze state, attack collision state, and animation state.

## 💀 Death & Retry Flow

<p align="center">
  <img src="docs/images/death-screen.png" alt="THE SHADOW death screen" width="900">
</p>

The project includes a dedicated death state and retry flow, with remaining attempts presented to the player and options to restart or leave the game.

## 🌍 Levels, Portals & Progression

The source project contains multiple level scenes, including later areas such as `level_2`, `level_3_new`, and `level_4`.

The portal / transition architecture includes:

- Player proximity detection
- `E` interaction
- Portal activation animation
- Transition screen
- Progressive transition text and animated dots
- Confirmation state before scene change
- `PackedScene` target assignment
- Godot scene switching with `change_scene_to_packed()`

> **Development note:** the portal/teleport architecture is implemented, but some map-to-map connections still require final integration.

## 🌅 Environmental Progression

A `day_night_controller.gd` system uses `CanvasModulate` to interpolate level atmosphere from brighter morning tones toward evening tones based on the player's horizontal progress through a level.

## ⚠️ Hazards & Interactive World

The project includes reusable gameplay/environment systems such as:

- Spike damage
- Kill zones / instant-death areas
- Saw traps and level-specific variants
- Fire hazards
- Moving and vertically moving platforms
- Environment objects and decorations
- Signs / player messages
- Spawn points and portal objects

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
| Area2D / CollisionShape2D | Combat, detection, hazards and triggers |
| AnimatedSprite2D | Character, enemy and world animation |
| GPUParticles2D | Freeze / gameplay feedback |
| ConfigFile | Persistent save/checkpoint storage |
| Autoload | Global save-management logic |
| Tween | UI and presentation animation |
| CanvasModulate | Environmental color progression |
| PackedScene | Portal and level target references |

## 🏗️ Project Structure

The original Godot source package contains approximately **47 GDScript files** and **30 `.tscn` scenes**, covering player mechanics, enemy AI, boss behavior, checkpoints, save management, UI, progression, hazards, portals, and environmental systems.

```text
project.godot
scripts/
├── checkpoint.gd
├── game_manager.gd
└── save_manager.gd
blue.gd
shop.gd
docs/
└── images/
    ├── main-menu.png
    ├── castle-level.png
    ├── village-level.png
    ├── burning-area.png
    ├── boss-intro.png
    ├── boss-encounter.png
    └── death-screen.png
```

The existing source structure is intentionally preserved where Godot resource paths depend on it, reducing the risk of breaking `res://` scene/resource references.

## 🤖 AI-Assisted Development with Codex

OpenAI Codex was used as an engineering assistant for:

- Debugging GDScript behavior
- Iterating gameplay logic
- Investigating scene/script integration problems
- Refactoring and improving individual systems
- Accelerating experimentation during development

This is presented as **AI-assisted development**, not autonomous game creation. Gameplay decisions, scene construction, integration, tuning, testing, and project direction remained part of the development process.

## 🚀 Running the Project

1. Install **Godot 4.6** or a compatible Godot 4.x version.
2. Clone or download the repository.
3. Open Godot Project Manager.
4. Import the folder containing `project.godot`.
5. Allow Godot to process/import assets if required.
6. Run the project from the editor.

```bash
git clone https://github.com/safialajati2-creator/the-shadow-game.git
cd the-shadow-game
```

## ✅ Verification & Current Status

During portfolio preparation:

- The source package was inspected as a Godot project rather than an exported executable
- `project.godot` and the configured project structure were checked
- Static `res://` references were checked against the cleaned package
- The cleaned portfolio copy was imported and successfully run in Godot on the developer's machine
- The known map-to-map portal completion remains an active development item

## 🎨 Assets & Credits

The project contains game-development assets, fonts, audio, custom/generated artwork, and third-party asset packs used during development. Their original license terms remain applicable. The repository is presented as a **game-development and software-engineering portfolio project**.

## 🎯 What This Project Demonstrates

THE SHADOW demonstrates practical experience with **Godot 4, GDScript, player controllers, platformer physics, directional combat, combo logic, collision-driven hit systems, behavior-based enemy AI, target tracking, patrol/environment awareness, adaptive boss logic, distance-based decision making, chase/dash behavior, arena repositioning, status effects, checkpoints, persistence, UI/HUD systems, progression economy, ability unlocking, environmental effects, debugging, and AI-assisted development workflows**.

## Developer

**Mustafa Alajati**  
Software Developer · Business Automation · AI-Assisted Development · Godot 4

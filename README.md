# 🌑 THE SHADOW

<p align="center">
  <b>English</b> | <a href="README_TR.md">Türkçe</a>
</p>

![Godot](https://img.shields.io/badge/Godot-4.6-478CBF?logo=godot-engine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-Gameplay%20Systems-478CBF)
![Genre](https://img.shields.io/badge/Genre-2D%20Action%20Platformer-black)
![AI](https://img.shields.io/badge/Game%20AI-Enemy%20%26%20Boss%20Behaviors-6f42c1)
![Status](https://img.shields.io/badge/Status-Playable%20Portfolio%20Build-success)

**THE SHADOW** is a 2D action-platformer built with **Godot 4.6** and **GDScript**. It combines responsive platforming, directional combat, behavior-based enemy AI, an adaptive boss encounter, traps, checkpoints, save/continue functionality, rune progression, an ability shop, UI feedback, and environmental transitions.

> **Current development state:** the portfolio build opens and runs successfully in Godot. Core gameplay systems are playable. The multi-map portal/teleport flow exists but is still being refined.

## 🎮 Gameplay Systems

### Player Controller & Movement
- Acceleration-based horizontal movement with ground/air friction
- Gravity-based jumping and platforming
- Character-facing and animation-state management
- Standard directional dash with visual feedback
- Unlockable **Special Dash** with higher speed, up to **3 charges**, recharge timing, and HUD synchronization
- Knockback, temporary invincibility, death states, checkpoint respawn, and status-effect handling

### ⚔️ Directional Combat
Combat uses `Area2D` / `CollisionShape2D` hit zones and includes:

- Front attack
- Upward attack
- Airborne downward attack
- Timed combo window for chained front attacks
- Direction-aware attack hitboxes
- Separate attack, combo, collision, damage, and hit-reaction states
- Freeze status effect with visual tint/particles and timed recovery

## 🧠 Behavior-Based Enemy AI

Enemies are not implemented as static animated obstacles. The project uses **game AI / behavior-based decision logic** to make enemies react to the player and the environment. This is deterministic gameplay AI rather than machine-learning AI.

The general enemy architecture follows a gameplay decision flow such as:

**Detection → Target Tracking → Facing / Movement → Range Evaluation → Attack Decision → Attack Timing / Cooldown → Damage / Death State**

Different enemy types extend this behavior in different ways.

### Standard Enemy AI
- Detects and tracks the player
- Evaluates attack range
- Faces/targets the player during encounters
- Uses timed attack hits instead of permanent damage collision
- Handles damage, knockback, death state, and rune rewards

### Skeleton AI
- Patrol-style movement
- Edge and wall awareness
- Changes behavior when encountering the player
- Faces the player before close-range attacks
- Timed melee attack behavior
- **3 health** by default
- Hit reactions, death state, and rune reward

### Wizard AI
- Edge/wall-aware movement
- Player-facing combat behavior
- Multiple attack animations (`attack` / `attack2`)
- Attack-selection variation
- Attack IDs prevent outdated delayed attacks from incorrectly damaging the player
- **5 health** by default
- Configured attacks can deal **2 damage**
- Higher rune reward than standard enemies

### Guard Behavior
The Guard uses a dedicated controller with its own movement, waiting, and turn logic, keeping its navigation behavior separate from the Skeleton and Wizard implementations.

## 👑 BLUE — Adaptive Boss AI

**BLUE** is a dedicated boss encounter with a more advanced behavior/state system than the regular enemies. The boss continuously reacts to the player's position and distance rather than following one fixed animation sequence.

### Boss Decision Making
The encounter combines:

- Player detection and target tracking
- Continuous facing toward the player
- **Distance-based action selection**
- Dash/chase behavior when the player is far away
- Attack behavior when the player enters combat distance
- Two randomized attack types to make the encounter less predictable
- Separate attack damage values and timed hit windows
- Hit reaction, damage, death state, and dedicated boss-health synchronization

Conceptually, the boss behavior follows:

**Track Player → Measure Distance → Select Chase / Dash / Attack → Execute Timed Action → Re-evaluate Player Position**

### ❄️ Freeze Attack
One of BLUE's attacks can apply a **Freeze status effect** to the player. The player controller responds by entering a temporary frozen state with dedicated visual feedback and timed recovery. This connects the boss AI directly with the player's status/state system rather than treating the attack as simple health damage.

### ⚡ Dynamic Arena Repositioning
BLUE also includes teleport/repositioning behavior during the encounter. The boss can move between **predefined teleport points inside the boss arena**, using the player's current position as part of the positioning logic.

This is described as dynamic arena repositioning rather than random teleportation around the player: the encounter logic works with designed arena points and player-relative positioning, allowing the boss to change spacing and force the player to readjust.

### Boss Presentation
- **15 health** by default
- Boss introduction overlay / fade animation
- Boss name display
- Dedicated boss health bar
- Runtime health updates

Together, the regular enemy behaviors and BLUE encounter demonstrate practical implementation of **game AI, target tracking, environmental awareness, distance-based decision making, state-driven combat, attack timing, status effects, and adaptive encounter behavior** in Godot.

## 💎 Rune Economy & Ability Progression

Defeated enemies can reward runes. `GameManager` tracks the rune economy and a dedicated UI displays the current amount.

The interactive shop includes:
- Player proximity detection
- `E` interaction
- Open/close UI flow
- Configurable ability cost
- Insufficient-rune feedback
- Already-purchased validation
- Ability purchase through `GameManager`

The implemented purchasable ability is **Special Dash**, expanding the player's movement options after purchase.

## ❤️ HUD & Gameplay Feedback
- Health / heart display
- Health fill UI
- Special Dash charge display
- Rune counter
- Death menu
- Interactive message UI
- Transition UI
- Boss intro, boss name, and boss health UI

Gameplay interfaces update dynamically from game state.

## 💾 Checkpoints, Save & Continue

`SaveManager` runs as a Godot Autoload and stores persistent checkpoint data using `ConfigFile` in:

```text
user://save_game.cfg
```

Saved information includes the current scene, checkpoint world position, and checkpoint state. The main menu supports **New Game**, **Continue**, and **Quit**, with Continue restoring the saved scene/checkpoint when valid save data exists.

Checkpoint activation updates the respawn point and persistence data. Respawn restores player position, health, movement/combat state, freeze state, attack collision state, and animation state.

## 🌍 Levels, Portals & World Progression

The source project contains multiple level scenes including `game.tscn`, `level_2.tscn`, `level_3_new.tscn`, and `level_4.tscn`.

Portal/transition architecture includes:
- Player proximity detection
- `E` interaction
- Portal activation animation
- Transition screen
- Progressive transition text and animated dots
- Confirmation state
- `PackedScene` target assignment
- `change_scene_to_packed()` scene switching

> **Development note:** the portal/teleport architecture is implemented, but the connections between every map are still being completed/refined. This was an existing development TODO before the portfolio cleanup.

## 🌅 Environmental Progression

`day_night_controller.gd` uses `CanvasModulate` to interpolate the atmosphere from brighter morning tones toward evening tones based on the player's horizontal progress through a level.

## ⚠️ Hazards & Interactive World
- Spike damage
- Kill zones / instant-death areas
- Saw traps and level-specific variants
- Fire hazards
- Moving and vertical platforms
- Environment objects
- Interactive signs/messages
- Portal decoration and spawn points

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
| CharacterBody2D | Player/character movement |
| Area2D / CollisionShape2D | Combat, AI detection, hazards, triggers |
| AnimatedSprite2D | Character, enemy and world animation |
| GPUParticles2D | Freeze/gameplay feedback |
| ConfigFile + Autoload | Save/checkpoint persistence |
| Tween | Menu and boss-introduction UI |
| CanvasModulate | Environmental color progression |
| PackedScene | Level/portal target references |

## 🏗️ Source Project Organization

The original Godot source package contains approximately **47 GDScript files** and **30 `.tscn` scenes**, covering player mechanics, enemy AI, the boss encounter, checkpoints, save management, progression, UI, hazards, portals, and environmental systems.

> The existing folder name `secnes/` is intentionally preserved because Godot resources reference it. Renaming it without updating every `res://` reference could break resource links.

## 🤖 AI-Assisted Development with Codex

**OpenAI Codex** was used as an engineering assistant for debugging GDScript, iterating gameplay logic, investigating scene/script integration, refactoring individual systems, and accelerating experimentation. It is presented as **AI-assisted development**, not autonomous game creation; gameplay decisions, Godot scene construction, integration, tuning, testing, and project direction remained part of the development process.

## 🚀 Running the Project

1. Install **Godot 4.6** or a compatible Godot 4.x build.
2. Clone/download the repository.
3. Import `project.godot` from Godot Project Manager.
4. Allow Godot to process assets if required.
5. Run the project.

```bash
git clone https://github.com/safialajati2-creator/the-shadow-game.git
cd the-shadow-game
```

Configured main scene: `res://secnes/game.tscn`

## ✅ Verification & Current Status

During portfolio preparation, the source package and Godot structure were reviewed, static `res://` references were checked against the cleaned package, and the cleaned portfolio copy was imported and run successfully on the developer's machine. The known map-to-map portal completion remains an active development item.

## 🎨 Assets & Credits

The project contains game-development assets, fonts, audio, custom/generated artwork, and third-party asset packs used during development. Their original license terms remain applicable. This repository is presented as a **game-development and software-engineering portfolio project**.

## 🎯 What This Project Demonstrates

THE SHADOW demonstrates practical experience with **Godot 4, GDScript, behavior-based game AI, enemy detection and targeting, patrol/environment awareness, adaptive boss logic, distance-based decision making, chase/dash behavior, dynamic arena repositioning, status effects, directional combat, combo logic, collision-driven hit systems, checkpoints, persistence, UI/HUD systems, progression economy, ability unlocking, environmental effects, level integration, debugging, and AI-assisted development workflows**.

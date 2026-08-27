# 🌑 THE SHADOW

<p align="center">
  <b>English</b> | <a href="README_TR.md">Türkçe</a>
</p>

![Godot](https://img.shields.io/badge/Godot-4.6-478CBF?logo=godot-engine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-Gameplay%20Systems-478CBF)
![Genre](https://img.shields.io/badge/Genre-2D%20Action%20Platformer-black)
![Status](https://img.shields.io/badge/Status-Portfolio%20Project-success)

**THE SHADOW** is a 2D action-platformer developed with **Godot 4** and **GDScript**. The project combines responsive character movement, directional combat, multiple enemy behaviors, traps, checkpoints, save/continue functionality, a rune-based shop system, level transitions, UI feedback, and multi-level progression.

The game was developed iteratively with AI-assisted development tools, including **OpenAI Codex**, for debugging, implementation support, code iteration, and workflow acceleration while the core gameplay design, integration, testing, and project decisions remained part of the development process.

<p align="center">
  <img src="asset/THE%20SHADOW%20GAME%20SCREEN.png" width="78%" alt="THE SHADOW game screen" />
</p>

## 🎮 Core Gameplay

### Player Controller
- Horizontal movement with acceleration and friction
- Jumping and gravity-based platforming
- Standard dash
- Unlockable special dash with limited charges and recharge timing
- Directional attacks: front, upward, and downward
- Combo-oriented combat flow
- Health, invincibility frames, knockback, hit states, and death handling
- Freeze/status effect handling
- Respawn and checkpoint integration

### Combat & Enemies
The project contains multiple enemy implementations and combat behaviors, including:

- Standard enemy logic
- Skeleton enemy
- Guard enemy
- Wizard enemy / encounter logic
- Player damage and hit reactions
- Attack areas and collision-based combat
- Enemy death states and combat timing

### World & Hazards
- Multiple playable levels and scenes
- Static and moving platforms
- Spike hazards
- Saw traps with level-specific variants
- Fire hazards
- Kill zones
- Portals and scene transitions
- Interactive signs / messages
- Day-to-evening visual progression controller

### Progression Systems
- Rune / coin collection system
- In-game shop interaction
- Ability purchase logic
- Special Dash ability unlock
- Checkpoint activation
- Persistent save data using Godot `ConfigFile`
- Continue-game support from the saved checkpoint

## 🕹️ Default Controls

| Action | Key |
|---|---|
| Move Left | Left Arrow |
| Move Right | Right Arrow |
| Jump | Space |
| Attack | Z |
| Up Attack | Up Arrow |
| Down Attack | Down Arrow |
| Dash | C |
| Special Dash | X |
| Interact | E |

## 🧰 Tech Stack

| Technology | Usage |
|---|---|
| Godot 4.6 | Game engine |
| GDScript | Gameplay, enemies, UI, save system, interactions |
| CharacterBody2D | Player and character movement |
| Area2D / CollisionShape2D | Combat, hazards, triggers, interaction zones |
| AnimatedSprite2D | Character and environment animations |
| ConfigFile | Save/checkpoint persistence |
| Tween | Main-menu and UI animation |
| CanvasModulate | Day/evening visual transition |

## 🏗️ Project Structure

```text
├── project.godot
├── scripts/
│   ├── character_body_2d.gd
│   ├── enemy.gd
│   ├── skeleton.gd
│   ├── guard.gd
│   ├── wizard.gd
│   ├── game_manager.gd
│   ├── save_manager.gd
│   ├── checkpoint.gd
│   ├── shop.gd
│   ├── portal_exit.gd
│   ├── day_night_controller.gd
│   └── ...
├── secnes/
│   ├── game.tscn
│   ├── level_2.tscn
│   ├── level_3_new.tscn
│   ├── level_4.tscn
│   ├── character_body_2d.tscn
│   ├── enemy.tscn
│   ├── skeleton.tscn
│   ├── wizard.tscn
│   └── ...
└── asset/
    └── game art, audio, fonts and environment assets
```

> The folder name `secnes/` is retained because it is part of the existing Godot resource paths. Renaming it without updating every resource reference could break the project.

## 💾 Save System

`SaveManager` is loaded as a Godot autoload and stores checkpoint progress in:

```text
user://save_game.cfg
```

The save data stores the current scene, checkpoint position, and checkpoint state. The main menu checks for an existing save and enables the **Continue** option when a valid save is available.

## 🧠 Development Highlights

This project demonstrates practical experience with:

- Building reusable Godot scenes
- Character-state and combat logic
- Enemy AI and encounter behavior
- Collision-driven gameplay systems
- Level progression and scene transitions
- Save/checkpoint architecture
- Gameplay UI and menu interactions
- Ability progression and shop mechanics
- Integrating third-party and custom visual assets into a working game
- Iterative debugging and AI-assisted software development

## 🚀 Run the Project

1. Install **Godot 4.6** or a compatible Godot 4.x release.
2. Clone the repository.
3. Open Godot Project Manager.
4. Import the repository folder by selecting `project.godot`.
5. Run the project.

```bash
git clone https://github.com/safialajati2-creator/the-shadow-game.git
cd the-shadow-game
```

The configured main scene is:

```text
res://secnes/game.tscn
```

## ✅ Project Integrity Review

Before preparing the portfolio version:

- The ZIP was verified to contain the complete Godot source project.
- `project.godot` and the configured main scene were present.
- 47 GDScript files and 30 `.tscn` scene files were identified.
- Referenced `res://` resources in project scene files were checked for missing paths; no missing file paths were found in the static reference scan.
- Generated Godot cache/build folders are excluded from version control.

A full runtime playthrough was **not** performed in the review environment because the Godot executable is not available there. Runtime behavior should therefore still be verified from the Godot editor before publishing a final release build.

## 🎨 Assets & Credits

The project contains a combination of game-development assets, fonts, audio, custom/generated artwork, and third-party asset packs used during development. Asset files and any included license documents remain subject to their respective original terms.

This repository is presented as a **software/game-development portfolio project**. If the project is distributed commercially, the license terms of every third-party asset should be reviewed for the intended distribution model.

## 🎯 Project Purpose

THE SHADOW demonstrates hands-on game-development skills in **Godot 4, GDScript, 2D platformer mechanics, combat systems, enemy behavior, game-state management, save/checkpoint systems, level design integration, UI development, and AI-assisted development workflows**.

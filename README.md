# 🌑 THE SHADOW

<p align="center">
  <b>English</b> | <a href="README_TR.md">Türkçe</a>
</p>

![Godot](https://img.shields.io/badge/Godot-4.6-478CBF?logo=godot-engine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-Gameplay-478CBF)
![Status](https://img.shields.io/badge/Status-Portfolio%20Project-success)

**THE SHADOW** is a 2D action-platformer project developed with **Godot 4.6** and **GDScript**. The game combines responsive character movement, directional combat, enemies with different behaviors, checkpoints, traps, a rune-based shop, save/continue logic, environmental transitions, and multi-level progression.

The project was built as a hands-on game-development study focused on gameplay systems, scene architecture, debugging, iteration, and AI-assisted development workflows using **OpenAI Codex** as a development aid.

## 🎮 Core Gameplay Systems

- Player movement, jumping and directional control
- Dash and special-dash mechanics
- Directional attacks and combo-oriented combat
- Health, damage, knockback and freeze reactions
- Multiple enemy types including Skeleton, Guard and Wizard behaviors
- Kill zones, saw traps and environmental hazards
- Checkpoints and respawn flow
- Portal-based level transitions
- Rune/shop system
- Save and continue system through `SaveManager`
- Day/evening environmental state management
- Multi-level scene progression

## 🧰 Technology

| Technology | Usage |
|---|---|
| Godot 4.6 | Game engine |
| GDScript | Gameplay and game-system scripting |
| Godot Scenes (`.tscn`) | Level and object composition |
| Autoload | Persistent save-management logic |
| OpenAI Codex | AI-assisted coding, debugging and iteration support |

## 🧠 Project Structure

The source project contains reusable gameplay scenes and scripts for systems such as:

- Player controller
- Enemies and combat behavior
- Checkpoints
- Shop / runes
- Traps and kill zones
- Platforms
- Portals
- Save management
- Day/night or environmental-state control
- Multiple game levels and UI scenes

The Godot project entry point is configured through `project.godot`, with the main game scene under the project's scene directory.

## 🤖 AI-Assisted Development

OpenAI Codex was used as a development assistant during parts of the implementation and debugging process. It supported tasks such as code iteration, troubleshooting, and refining gameplay logic. Game design decisions, scene construction, integration, testing, and overall project direction remained part of the development workflow.

## 🎨 Assets

The project uses a collection of visual/audio assets assembled for the game-development workflow. Asset files remain associated with their respective original licenses where applicable. This repository is presented as a portfolio and development project rather than as a commercial asset redistribution package.

## 🚀 Running the Project

1. Install **Godot 4.6** or a compatible Godot 4.x version.
2. Clone the repository.
3. Import `project.godot` in Godot Project Manager.
4. Allow Godot to import project assets.
5. Run the main scene/project.

```bash
git clone https://github.com/safialajati2-creator/the-shadow-game.git
```

## 📸 Screenshots / Gameplay

Gameplay screenshots and additional portfolio visuals will be added here.

## ✅ Portfolio Verification

The portfolio preparation included a static review of the Godot project structure, scripts, scenes, project configuration and resource references. The repository was cleaned of generated Godot cache/import data and unnecessary operating-system/editor files before publication.

> A complete gameplay playthrough is not claimed as part of this repository review; final runtime behavior should be verified directly in Godot on the target machine.

## 🎯 Project Purpose

THE SHADOW demonstrates practical experience with **Godot 4, GDScript, 2D character controllers, combat systems, enemy behavior, scene composition, checkpoints, persistence, gameplay UI, level progression, debugging and AI-assisted game development**.

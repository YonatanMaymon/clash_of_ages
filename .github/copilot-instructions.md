# Copilot Instructions for Clash of Ages

## Project Overview

Clash of Ages is a competitive 1v1 strategy game inspired by "Age of War" and "Clash Royale." The game emphasizes steady progress between matches, strategic deck-building, and unit upgrades. Players advance through different ages, unlocking and upgrading units, runes, and other resources to outmaneuver their opponents.

### Key Features:

- **Competitive Gameplay**: 1v1 matches with no AI opponents.
- **Progression System**: Unlock and upgrade units, runes, and bonuses through chests and leveling up.
- **Deck-Building**: Players construct decks tailored to their strategy for each age.
- **Strategic Layers**: Includes mechanics like rock-paper-scissors counters, age-specific bonuses, and stalemate resolution.

## Codebase Architecture

### Major Components:

1. **Assets** (`assets/`):

   - Contains graphical assets for characters, environments, and UI elements.
   - Subfolders like `characters/`, `hp bar/`, and `platformer/` organize assets by type.

2. **Scenes** (`scenes/`):

   - `game.tscn`: Main game scene.
   - `skeleton.tscn`: Represents a specific unit or entity in the game.

3. **Scripts** (`scripts/`):
   - Core game logic is implemented in GDScript files.
   - Examples:
     - `game.gd`: Manages overall game flow.
     - `unitSpawner.gd`: Handles spawning of units.
     - `health.gd`: Manages health-related mechanics.

### Data Flow:

- **Game State**: Managed primarily in `game.gd`.
- **Unit Behavior**: Defined in `actor.gd`, `unit.gd`, and `skeleton.gd`.
- **Health and Damage**: Controlled by `health.gd`.
- **Spawning Logic**: Implemented in `unitSpawner.gd`.

### External Dependencies:

- No external libraries or plugins are currently used.

## Development Workflows

### Building and Running:

1. Open the project in Godot Engine.
2. Run the game by pressing `F5` or selecting the "Play" button.

### Debugging:

- Use Godot's built-in debugger to inspect variables, breakpoints, and errors.
- Check the output console for runtime logs.

### Testing:

- No automated tests are defined. Testing is manual via gameplay.

## Project-Specific Conventions

### GDScript:

- Follow Godot's official GDScript style guide.
- Use descriptive variable and function names (e.g., `spawn_unit`, `calculate_damage`).

### Scene Organization:

- Each `.tscn` file represents a distinct game entity or scene.
- Scripts are attached to scenes or nodes to encapsulate functionality.

### Asset Management:

- Keep assets organized in subfolders by type (e.g., `characters/`, `platformer/`).
- Use `.import` files to manage asset metadata.

## Examples

### Unit Spawning:

The `unitSpawner.gd` script handles spawning logic. Example:

```gdscript
func spawn_unit(unit_type: String, position: Vector2):
    var unit_scene = preload("res://scenes/" + unit_type + ".tscn")
    var unit_instance = unit_scene.instance()
    unit_instance.position = position
    add_child(unit_instance)
```

### Health Management:

The `health.gd` script manages health mechanics. Example:

```gdscript
func take_damage(amount: int):
    health -= amount
    if health <= 0:
        die()
```

## Notes for AI Agents

- Focus on maintaining the project's existing structure and conventions.
- When adding new features, ensure compatibility with the progression and deck-building systems.
- Avoid introducing external dependencies unless absolutely necessary.
- Document any new scripts or scenes thoroughly.

---

Feel free to iterate on these instructions based on feedback or as the project evolves.

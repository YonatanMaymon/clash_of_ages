extends Node2D
class_name UnitSpawner

## PackedScene to spawn (e.g., your Unit.tscn)
@export var unit_scene: PackedScene

## Which team this spawner belongs to
@export var team: Actor.Team = Actor.Team.LEFT

## Where units appear (if null, use this node's position)
@export var spawn_point: Node2D

## Auto-spawn control
@export var auto_spawn: bool = false
@export var spawn_interval: float = 2.0  # seconds
@export var max_units: int = 10           # optional limit

var _timer: Timer
var _unit_count: int = 0

func _ready() -> void:
	if auto_spawn:
		_timer = Timer.new()
		_timer.wait_time = spawn_interval
		_timer.autostart = true
		_timer.timeout.connect(spawn_unit)
		add_child(_timer)

func spawn_unit() -> void:
	if unit_scene == null:
		push_warning("MobSpawner has no unit_scene assigned.")
		return

	if max_units > 0 and _unit_count >= max_units:
		return  # Stop if max is reached

	var unit: Actor = unit_scene.instantiate()
	unit.global_position = spawn_point.global_position if spawn_point else global_position
	unit.assign_team(team)

	get_tree().current_scene.add_child(unit)
	_unit_count += 1

	# When unit dies, reduce count
	#unit.health.died.connect(func(): _unit_count -= 1)

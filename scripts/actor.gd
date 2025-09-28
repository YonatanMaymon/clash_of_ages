extends Node2D
class_name Actor

enum Team {LEFT,RIGHT}

@export var max_health: int = 100 

var health: Health
var team: Team


func _ready() -> void:
	health = Health.new(max_health)
	health.died.connect(_on_death)

func assign_team(_team:Team) -> void:
	self.team = _team
	if team == Team.RIGHT:
		face_left()

func face_left() ->void:
	scale.x = -abs(scale.x)

func take_damage(damage:int) -> void:
	health.take_damage(damage)

func is_dead() -> bool:
	return health.is_dead()

func _on_death():
	die()
	
func die():
	queue_free()

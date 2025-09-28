extends Actor
class_name Unit

@export var damage:int = 25
@export var attack_speed: float = 3.0
@export var speed : int = 30
var sec_between_attack = 10.0 / attack_speed
var enemy : Actor

func _ready() -> void:
	super()

func _physics_process(delta: float) -> void:
		walk(delta)

func walk(delta:float) -> void:
	global_position += scale.x * Vector2.RIGHT * speed * delta

func attack() -> void:
	if is_instance_valid(enemy):
		enemy.take_damage(damage)

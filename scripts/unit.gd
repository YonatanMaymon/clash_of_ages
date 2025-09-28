extends Actor
class_name Unit

@export var damage:int = 25
@export var speed: int = 200 
@export var attack_speed: float = 3.0

var attack_cooldown: Timer

func _ready() -> void:
	attack_cooldown = Timer.new()
	attack_cooldown.set_wait_time(attack_speed)	

func _physics_process(delta: float) -> void:
	if attack_cooldown.time_left == 0.0:
		walk(delta)

func walk(delta:float) -> void:
	global_position += scale.x * Vector2.RIGHT * speed * delta

func attack(actor: Actor) -> void:
	actor.take_damage(damage)
	attack_cooldown.start()

class_name Health
extends Resource

signal died

var max_hp: int
var current_hp: int

func _init(hp: int = 100) -> void:
	self.max_hp = hp
	self.current_hp = hp

## Applies damage. Emits `died` if health <= 0.
func take_damage(damage: int) -> void:
	current_hp = max(current_hp - damage, 0)
	if current_hp <= 0:
		emit_signal("died")

func is_dead() -> bool:
	return current_hp <= 0

func heal(amount: int) -> void:
	current_hp = min(current_hp + amount, max_hp)

func reset() -> void:
	current_hp = max_hp

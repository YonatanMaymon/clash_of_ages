extends Camera2D
class_name DragCamera

@export var drag_speed: float = 1.0  # Adjust sensitivity
@export var min_x: float = -1000.0   # Left clamp
@export var max_x: float = 1000.0    # Right clamp

var dragging := false
var last_mouse_pos: Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				last_mouse_pos = event.position
			else:
				dragging = false

	elif event is InputEventMouseMotion and dragging:
		var delta: Vector2 = event.position - last_mouse_pos
		global_position.x -= delta.x * drag_speed
		global_position.x = clamp(global_position.x, min_x, max_x)
		last_mouse_pos = event.position

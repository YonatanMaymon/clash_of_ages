extends Unit

var layer = 1
var mask = 2


func _physics_process(_delta: float) -> void:
	if (is_dead()) or (%animation.animation == "attack" and %animation.is_playing()):
		return
	var enemies_in_range = %"Attack Range".get_overlapping_areas()
	if enemies_in_range.size()>0:
		enemy = enemies_in_range[0].get_parent()
		attack()
	else:
		super(_delta)



func walk(delta:float) -> void:
	super(delta)
	#adjust the animation speed to the walking speed
	%animation.play("walk", speed / 30.0)

func attack() -> void:
	#adjust the attack to the attack speed
	%animation.play("attack" , 2.0 / sec_between_attack)

func assign_team(_team:Team) -> void:
	super.assign_team(_team)
	if team == Team.RIGHT:
		layer = 2
		mask = 1
	applyInteruction()

func applyInteruction(on: bool = true):
	%"Attack Range".set_collision_mask_value(mask,on)
	%HitBox.set_collision_layer_value(layer,on)
	
func die():
	%"Queue Free Timer".start()
	applyInteruction(false)
	%animation.play("death")

func _on_frame_changed() -> void:
	if %animation.animation == "attack":
		if %animation.frame == 7 and is_instance_valid(enemy):
			enemy.take_damage(damage)

func _on_queue_free_timer_timeout() -> void:
	queue_free()

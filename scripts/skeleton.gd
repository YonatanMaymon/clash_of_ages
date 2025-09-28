extends Unit

var layer = 1
var mask = 2
	
func _physics_process(delta: float) -> void:
	var enemies_in_range = %"Attack Range".get_overlapping_areas()
	if enemies_in_range.size()>0:
		attack(enemies_in_range[0])

func walk(delta:float) -> void:
	super(delta)
	%animation.play("walk")

func attack(actor: Actor) -> void:
	if attack_cooldown.time_left == 0.0:
		super(actor)
		%animation.play("attack")
		%animation.queue("idle")

func assign_team(team:Team) -> void:
	super.assign_team(team)
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

extends CharacterBody2D

const MAX_SPEED = 125
const ACCELERATION_SMOOTHING =  25

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	var target_velocity = direction * MAX_SPEED
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	
	move_and_slide()

func get_movement_vector():
	var x_movement = Input.get_action_strength("右") - Input.get_action_strength("左")
	var y_movement = Input.get_action_strength("下") - Input.get_action_strength("上")
	return Vector2(x_movement,y_movement)

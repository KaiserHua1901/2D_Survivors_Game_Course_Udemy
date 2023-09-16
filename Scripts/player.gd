extends CharacterBody2D

const MAX_SPEED = 300 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	# this make it work normalized shit, IDK 
	velocity = direction * MAX_SPEED
	move_and_slide()

func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	# if right is press, the x Vector will became 1 
	# if left is press, x Vector became -1 
	# if both are press, x Vector became 0 
	# get_action_strength will make it so that it will became 1 when press on key board
	# because it only can display 1 or 0, key board, if on joystick it can display depend on 
	# the way you move the joystick 
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement)

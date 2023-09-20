extends CharacterBody2D

@export var speed = 80

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = get_direction_to_Player() 
	velocity = direction * speed
	move_and_slide()


func get_direction_to_Player():
	var player_nodes = get_tree().get_first_node_in_group("Player") as Node2D
	if player_nodes != null: 
		return (player_nodes.global_position - global_position). normalized()
	return Vector2.ZERO 
	

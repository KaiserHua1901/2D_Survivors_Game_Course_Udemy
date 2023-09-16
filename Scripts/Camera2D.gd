extends Camera2D

var target_position = Vector2.ZERO 

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	acquire_target()
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 10))
	# This math is for smoother the camera transition from the player
	
	
func acquire_target(): 
	var player_node = get_tree().get_nodes_in_group("Player")
	
	if player_node.size() > 0:
		#this if is for chosing which one on the group to use, group is a array 
		var player = player_node[0] as Node2D
		# as Node2D is for player_node get recoginise as a Node2D so it show more option 
		# when do player.global_ ..... 
		target_position = player.global_position

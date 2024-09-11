extends Node2D

@onready var hud = $HUD
@onready var obstacle_spawner = $ObstacleSpawner

var started: bool = false;

func _ready():
	obstacle_spawner.stop()
	get_tree().call_group("Obstacles", "set_physics_process", false) 
	
func _process(delta):
	if Input.is_action_just_pressed("Flap") && !started:
		started = true;
		obstacle_spawner.start()
		get_tree().call_group("Obstacles", "set_physics_process", true) 

func _on_bird_died():
	game_over()
	
func game_over():
	#Stops the pipes from spawning
	obstacle_spawner.stop()
	#Stops ground from moving
	$Ground.get_node("AnimationPlayer").stop()
	#deactivates physics of the pipes, preventing them from moving
	get_tree().call_group("Obstacles", "set_physics_process", false) 
	
	var current_score: int = Globals.SCORE;
	if Globals.HIGH_SCORE < current_score:
		Globals.HIGH_SCORE = current_score
		print(Globals.HIGH_SCORE)
	
	$MenuLayer.init_game_over_menu(current_score);
	Globals.SCORE = 0;

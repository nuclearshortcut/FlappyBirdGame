extends Node2D

@onready var timer = $Timer
var Pipes = preload("res://Scenes/pipes.tscn")
var started: bool = false;
var rng = RandomNumberGenerator.new()

var Obstacle = preload("res://Scenes/pipes.tscn")

func _on_timer_timeout():
	spawn_obstacle()

func spawn_obstacle():
	var pipes = Pipes.instantiate()
	add_child(pipes)
	pipes.position.y = rng.randf_range(500, 250) # random position of obstacles

func start():
	timer.start()
	
func stop():
	timer.stop()

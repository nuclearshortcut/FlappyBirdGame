extends Node2D

signal score;

const SPEED = 200;
var started: bool = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += -SPEED * delta; # moving pipes left
	if global_position.x <= -200:
		queue_free()


func _on_pipe_body_entered(body):
	if body.is_in_group("Player"):
		if body.has_method("die"):
			body.die()


func _on_score_area_body_exited(body):
	if body.is_in_group("Player"):
		Globals.SCORE += 1;

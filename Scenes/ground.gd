extends StaticBody2D

func _on_death_zone_body_entered(body):
	if body.is_in_group("Player"):
		if body.has_method("die"):
			body.die()

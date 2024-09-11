extends CharacterBody2D

var MAX_SPEED = 400;
var GRAVITY = 900;
var JUMP_FORCE = -300;
var ROTATION_SPEED = 2;

var started: bool = false;
var alive: bool = true;
signal died;

func _ready():
	velocity = Vector2.ZERO; # Bird won't move at all 

func _physics_process(delta):
	if !started:
		$AnimationPlayer.play()
	
	if Input.is_action_just_pressed("Flap") && alive:
		if !started:
			started = true;
			$AnimationPlayer.stop()
		jump()
		$BirdImage.play("Flap")
		$FlapTimer.start()
	
	if !started:
		return
	
	if alive:
		velocity.y += GRAVITY * delta;
		velocity.y = min(velocity.y, MAX_SPEED) # prevents from flapping too high
		move_and_collide(velocity * delta)
		rotate_bird()

func jump():
	velocity.y = JUMP_FORCE;
	rotation = deg_to_rad(-30)
	
func rotate_bird():
	# Rotate downwards when falling
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += ROTATION_SPEED * deg_to_rad(1)
	#Rtoate upwards when rising
	elif velocity.y < 0 && rad_to_deg(rotation) > -30:
		rotation -= ROTATION_SPEED * deg_to_rad(1)

func _on_flap_timer_timeout():
	$BirdImage.stop()

func die():
	if !alive: return
	alive = false;
	$BirdImage.stop()
	emit_signal("died")

extends CanvasLayer

signal start_game

var started = false;

@onready var start_message = $StartMenu/StartMessage
@onready var score_label = $GameOverMenu/VBoxContainer/ScoreLabel
@onready var high_score_label = $GameOverMenu/VBoxContainer/HighScoreLabel
@onready var game_over_menu = $GameOverMenu

func _ready():
	game_over_menu.visible = false;

func _input(event):
	if Input.is_action_just_pressed("Flap") && !started:
		emit_signal("start_game")
		started = true
		$AnimationPlayer.play("fade_out")
		

func init_game_over_menu(score):
	print(Globals.HIGH_SCORE)
	high_score_label.text = "BEST: " + str(Globals.HIGH_SCORE)
	score_label.text = "SCORE: " + str(score)
	game_over_menu.visible = true;
	
func _on_RestartButton_presssed():
	get_tree().reload_current_scene()

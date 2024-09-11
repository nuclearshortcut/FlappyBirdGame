extends CanvasLayer

func _ready():
	Globals.connect("score_change", _update_score);


func _update_score():
	$Score.text = str(Globals.SCORE)

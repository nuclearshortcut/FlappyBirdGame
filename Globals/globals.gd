extends Node

signal score_change
signal high_score_change

var SCORE: int = 0:
	set(value):
		SCORE = value;
		emit_signal("score_change");
	get:
		return SCORE;

var HIGH_SCORE: int = 0:
	set(value):
		HIGH_SCORE = value;
		emit_signal("high_score_change");
	get:
		return HIGH_SCORE;

extends Control


func _process(_delta) -> void:
	$Lives.text = str("Lives: ", Global.lives)
	var score_str = str(Global.score).pad_zeros(10)
	var padded_zeros = score_str.substr(0, 10 - len(str(Global.score)))
	var bbcode_score = "[color=gray]" + padded_zeros + "[/color]" + str(Global.score)
	$Score.text = bbcode_score

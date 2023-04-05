extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.get_child(0).texture = load(GlobalOptions.square_sprite_dark_path)

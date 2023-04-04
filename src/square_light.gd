extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$sprite.texture = load(GlobalOptions.square_sprite_light_path)

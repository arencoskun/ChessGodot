class_name Square
extends Node

var light: bool
var piece: Piece
var scene: Node2D

func _init(board: Node2D, light: bool, position: Vector2, piece: Piece = null):
	self.light = light
	self.piece = piece
	if not self.light:
		scene = preload("res://res/scenes/square_dark.tscn").instantiate()
		if(piece != null):
			add_piece(piece)
		scene.global_scale = GlobalOptions.square_scaling
		scene.global_position = position
		board.add_child(scene)
	else:
		scene = preload("res://res/scenes/square_light.tscn").instantiate()
		if(piece != null):
			add_piece(piece)
		scene.global_scale = GlobalOptions.square_scaling
		scene.global_position = position
		board.add_child(scene)
		
	#print("Sprite created")

func add_piece(piece: Piece):
	var s_piece = piece.create()
	scene.add_child(s_piece)

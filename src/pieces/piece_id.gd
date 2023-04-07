extends Node

enum PIECE_ID {
	PAWN
}

var PIECE_TEXTURES = {
	0: load("res://res/assets/w_pawn_png_shadow_128px.png"),
	1: load("res://res/assets/b_pawn_png_shadow_128px.png")
}

var PIECE_SCENES = {
	PIECE_ID.PAWN: load("res://res/scenes/pieces/pawn.tscn")
}

var PIECE_CLASSES = {
	PIECE_ID.PAWN: Pawn
}

var selected_piece: Piece
var move_target: Square
var move_target_scene: Node2D

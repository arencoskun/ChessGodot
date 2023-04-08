class_name Pawn
extends Piece

func _init(white: bool):
	self.id = PieceID.PIECE_ID.PAWN
	self.white = white
	self.texture = PieceID.PIECE_TEXTURES[0] if self.white else PieceID.PIECE_TEXTURES[1]
	#self.texture = preload("res://res/assets/b_pawn_png_shadow_128px.png")
	self.scene = PieceID.PIECE_SCENES[self.id]
	self.move_offsets = [-8 if white else 8]
	
	#var piece: Node2D = PieceID.PIECE_SCENES[PieceID.PIECE_ID.PAWN].instantiate()
	#piece.get_node("sprite").texture = self.texture
	#piece.global_position = position
	#piece.global_scale = Vector2(0.5, 0.5)
	#square.add_child(piece)

func create() -> Node2D:
	var new_scene: Node2D = self.scene.instantiate()
	new_scene.get_node("sprite").texture = self.texture
	
	return new_scene

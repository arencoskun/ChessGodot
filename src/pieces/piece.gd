class_name Piece
extends Node

var id: PieceID.PIECE_ID
var texture: CompressedTexture2D
var scene: PackedScene
var white: bool
var selected: bool = false
var boardIndex: int
var move_offsets: Array[int]

func get_moveable_positions() -> Array[int]:
	var moveable_positions: Array[int]
	
	for i in move_offsets:
		if self.boardIndex + i >= 0 and self.boardIndex + i <= GlobalOptions.board_width * GlobalOptions.board_height - 1:
			moveable_positions.append(self.boardIndex + i)
	
	return moveable_positions

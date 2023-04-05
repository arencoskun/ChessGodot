extends Area2D


func _on_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		var boardSquares: Array[Square] = get_node("/root/game_scene/board").board
		var boardIndex: int = get_node("/root/game_scene/board").boardScenes.find(get_parent())
		var square: Square = boardSquares[boardIndex]
		PieceID.selected_piece = square.piece
		

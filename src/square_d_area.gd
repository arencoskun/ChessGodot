extends Area2D

func _on_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		GlobalOptions.select_count += 1
		var boardSquares: Array[Square] = get_node("/root/game_scene/board").board
		var boardScenes: Array[Node2D] = get_node("/root/game_scene/board").boardScenes
		var boardIndex: int = get_node("/root/game_scene/board").boardScenes.find(get_parent())
		var square: Square = boardSquares[boardIndex]
		
		if(GlobalOptions.select_count == 1):
			if(square.piece == null):
				print("Piece is null")
				GlobalOptions.select_count = 0
				return
			else:
				PieceID.selected_piece = square.piece
				GlobalOptions.firstSelectedSquare = square
		elif(GlobalOptions.select_count == 2):
			PieceID.move_target = square
			PieceID.move_target_scene = boardScenes[boardIndex]
			
			PieceID.move_target.add_piece(PieceID.PIECE_CLASSES[PieceID.selected_piece.id].new(PieceID.selected_piece.white))
			GlobalOptions.select_count = 0
			GlobalOptions.firstSelectedSquare.remove_piece()
			#PieceID.move_target_scene = null
		
		print("Count: " + str(GlobalOptions.select_count))
		print("Selected Piece: " + str(PieceID.selected_piece) + " Selected Square: " + str(PieceID.move_target) + " (" + str(PieceID.move_target_scene) + ")")
		

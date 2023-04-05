extends Node2D

const scaled_size = GlobalOptions.square_sprite_size * GlobalOptions.square_scaling.x
var board: Array[Square]
var boardScenes: Array[Node2D]

const starting_board_file = "res://res/starting_board.txt"

func loadStartingBoard():
	var startingBoard: PackedStringArray = []
	var file = FileAccess.open(starting_board_file, FileAccess.READ)
	var content = file.get_as_text()
	
	startingBoard = content.split(",")
	
	print(startingBoard)
	
	for i in range(startingBoard.size()):
		if startingBoard[i].contains(";"):
			var type = startingBoard[i].split(";")[0]
			var color = startingBoard[i].split(";")[1]
			
			getOnBoard(boardIndexToVector(i)).add_piece(PieceID.PIECE_CLASSES[int(type)].new(true if color == "1" else false))
	
	file = null

func createBoard(a_board) -> void:
	a_board.resize(GlobalOptions.board_width * GlobalOptions.board_height)
	
func vectorToBoardIndex(vector: Vector2) -> int:
	return vector.y * GlobalOptions.board_height + vector.x
	
func boardIndexToVector(index: int) -> Vector2:
	# TODO: Make it so the board width and height variables are only one variable and are in capital case
	# TODO: Also fix the warnings
	return Vector2(index % GlobalOptions.board_width, (index - (index % GlobalOptions.board_height)) / GlobalOptions.board_height)
	
func setOnBoard(position: Vector2, toSet: Square):
	board[vectorToBoardIndex(position)] = toSet
	
func getOnBoard(position: Vector2) -> Square:
	return board[vectorToBoardIndex(position)]

func _ready() -> void:
	#Square.new(self, true, Vector2(16, 16))
	#Square.new(self, false, Vector2(48, 16))
	#Square.new(self, (x + y) % 2, Vector2(16 + x * 32, 16 + y * 32))
	createBoard(board)
	createBoard(boardScenes)
	
	
	for x in range(GlobalOptions.board_width):
		for y in range(GlobalOptions.board_height):
			var square: Square = Square.new(self, (x + y) % 2, Vector2(
				scaled_size / 2 + x * scaled_size,
				scaled_size / 2 + y * scaled_size
			))
			
			setOnBoard(Vector2(x, y), square)
			boardScenes[vectorToBoardIndex(Vector2(x, y))] = square.scene
			#await get_tree().create_timer(0.5).timeout
			
	global_position = Vector2(
		DisplayServer.window_get_size().x / 2 - (scaled_size * GlobalOptions.board_width) / 2,
		DisplayServer.window_get_size().y / 2 - (scaled_size * GlobalOptions.board_height) / 2
	)
	
	loadStartingBoard()
	
	#getOnBoard(Vector2(2, 2)).add_piece(Pawn.new(true))

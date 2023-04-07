extends Node

### BOARD ###
const board_width: int = 8
const board_height: int = 8

### SQUARE ###
const square_scaling: Vector2 = Vector2(0.5, 0.5)
const square_sprite_size = 128
var square_sprite_light_path: String = "res://res/assets/brown_light.png"
var square_sprite_dark_path: String = "res://res/assets/brown_dark.png"

### MISC ###
var select_count = 0
var firstSelectedSquare: Square

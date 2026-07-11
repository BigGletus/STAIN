extends CharacterBody2D

signal walk_send(dir: Vector2)

var can_move: bool = true
var player_turn: bool = true

func move(dir: int) -> void:
	if can_move:
		match dir:
			1: if !$right.is_colliding():
				walk_send.emit(Vector2.RIGHT)
				print("right")
			2: if !$left.is_colliding():
				walk_send.emit(Vector2.LEFT)
				print("left")
			3: if !$up.is_colliding():
				walk_send.emit(Vector2.UP)
				print("up")
			4: if !$down.is_colliding():
				walk_send.emit(Vector2.DOWN)
				print("down")

func move_true() -> void:
	can_move = true

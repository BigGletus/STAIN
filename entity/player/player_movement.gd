extends CharacterBody2D

signal walk_send(dir: Vector2)

const TILE_SIZE: int  = Global.TILE_SIZE 

var can_move: bool = true

func _physics_process(_delta: float) -> void:
	if can_move:
		if Input.is_action_pressed("move_right") and !$right.is_colliding():
			walk_send.emit(Vector2.RIGHT)
			print("right")
		if Input.is_action_pressed("move_left") and !$left.is_colliding():
			walk_send.emit(Vector2.LEFT)
			print("left")
		if Input.is_action_pressed("move_up") and !$up.is_colliding():
			walk_send.emit(Vector2.UP)
			print("up")
		if Input.is_action_pressed("move_down") and !$down.is_colliding():
			walk_send.emit(Vector2.DOWN)
			print("down")

func move_true() -> void:
	can_move = true

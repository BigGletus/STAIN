extends CharacterBody2D

var input_dir: Vector2
var moving: bool = false
const TILE_SIZE: int = 32

func _ready():
	pass

func _physics_process(delta):
	input_dir = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		#get_parent().global_position += Vector2(8,0)
		input_dir += Vector2.RIGHT
	if Input.is_action_pressed("move_left"):
		#get_parent().global_position += Vector2(-8,0)
		input_dir += Vector2.LEFT
	if Input.is_action_pressed("move_up"):
		#get_parent().global_position += Vector2(0,-8)
		input_dir += Vector2.UP
	if Input.is_action_pressed("move_down"):
		#get_parent().global_position += Vector2(0,8)
		input_dir += Vector2.DOWN
	walk()
	move_and_slide()

func walk():
	if input_dir:
		if moving == false:
			moving = true
			velocity = input_dir*TILE_SIZE

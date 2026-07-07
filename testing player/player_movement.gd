extends CharacterBody2D

var input_dir: Vector2
var moving: bool = false
const TILE_SIZE: int = 32 #The asset pack uses 32p for the assets. I might make it 16 to move half a square as movement for more granularity. 
						  #Might need to turn pixel size into an autoload if it shows up enough


func _ready():
	pass

func _physics_process(delta):
	input_dir = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		input_dir = Vector2.RIGHT
		walk()
	if Input.is_action_pressed("move_left"):
		input_dir = Vector2.LEFT
		walk()
	if Input.is_action_pressed("move_up"):
		input_dir = Vector2.UP
		walk()
	if Input.is_action_pressed("move_down"):
		input_dir = Vector2.DOWN
		walk()

func walk():
	if input_dir:
		if moving == false:
			moving = true
			var tween = create_tween()
			tween.tween_property(self, "position", position + input_dir*TILE_SIZE, 0.2)
			tween.tween_callback(move_false)

func move_false():
	moving = false

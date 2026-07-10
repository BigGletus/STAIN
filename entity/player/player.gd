extends Character

const TILE_SIZE: int  = Global.TILE_SIZE

@onready var MovementHandler: CharacterBody2D = $MovementHandler

var move_tween: Tween

func _ready() -> void:
	current_targets.append(get_parent().get_parent().get_child(0))

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("click_left"):
		$AbilityController.ability_decide(ability_list[0], current_targets)

func _on_walk_receive(dir: Vector2) -> void:
	if !move_tween or !move_tween.is_running():
		MovementHandler.can_move = false
	if move_tween:
		move_tween.kill()
	move_tween = create_tween()
	move_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	move_tween.tween_property(self, "global_position", global_position+dir*Global.TILE_SIZE , 0.185).set_trans(Tween.TRANS_SINE)
	move_tween.tween_callback(MovementHandler.move_true)

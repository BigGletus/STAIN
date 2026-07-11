extends Character

const TILE_SIZE: int  = Global.TILE_SIZE

var move_tween: Tween

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_walk_receive(dir: Vector2) -> void:
	if !move_tween or !move_tween.is_running():
		MovementController.can_move = false
	if move_tween:
		move_tween.kill()
	move_tween = create_tween()
	move_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	move_tween.tween_property(self, "global_position", global_position+dir*Global.TILE_SIZE , 0.185).set_trans(Tween.TRANS_SINE)
	move_tween.tween_callback(MovementController.move_true)

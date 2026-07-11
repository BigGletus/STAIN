extends Node

@onready var ParentEntity: Node = get_parent()
@onready var AbilityController: Node = ParentEntity.AbilityController
@onready var MovementController: Node = ParentEntity.MovementController

var target_select: bool = false

func _input(_event: InputEvent) -> void:
	if not ParentEntity.is_player_controlled:
		return
	
	if Input.is_action_just_pressed("menu_character"):
		target_select = !target_select
		if target_select: print("selection mode active")
		else: print("selection mode inactive")

func _process(_delta: float) -> void:
	if not ParentEntity.is_player_controlled:
		return
	
	if Input.is_action_pressed("move_right"):
		MovementController.move(1)
	if Input.is_action_pressed("move_left"):
		MovementController.move(2)
	if Input.is_action_pressed("move_up"):
		MovementController.move(3)
	if Input.is_action_pressed("move_down"):
		MovementController.move(4)

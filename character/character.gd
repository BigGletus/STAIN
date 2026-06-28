extends Node2D
class_name Character

@export var player_controlled: bool
@export var current_hp: int
@export var maximum_hp: int

func _ready():
	pass

func _process(delta):
	pass

func take_damage(damage):
	current_hp -= damage

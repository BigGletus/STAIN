extends Node2D
class_name Character

# Stats
@export var player_controlled: bool
@export var maximum_hp: int
@export var current_hp: int
@export var ability_list: Array[Ability]

# Controllers
@export var AbilityController: Node
#@export var HealthController: Node

# Internals
var current_targets: Array[Character]

func _ready() -> void:
	pass

func take_damage(damage: int) -> void:
	current_hp -= damage
	print("YEEOUCH")

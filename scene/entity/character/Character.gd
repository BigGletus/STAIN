extends Node2D
class_name Character

# Stats
@export var character_name: String
@export var maximum_hp: int
@export var current_hp: int
@export var ability_list: Array[Ability]

# Controllers
@export var is_player_controlled: bool ## Whether or not the Character is currently being controlled by the player.
@export var AbilityController: Node
@export var InputController: Node
@export var HealthController: Node
@export var MovementController: Node

# Internals
var current_targets: Array[Character]

func _ready() -> void:
	pass

func adjust_health(amount: int) -> void:
	current_hp += amount
	if amount <= 0:
		print(character_name + " took " + str(amount) + " damage!")
	else:
		print(character_name + " healed for " + str(amount) + " health!")

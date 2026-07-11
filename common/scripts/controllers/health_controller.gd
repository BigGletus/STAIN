extends Node

var current_hp = get_parent

func take_damage(damage: int) -> void:
	current_hp -= damage
	print(character_name + " took " + str(damage) + " damage!")

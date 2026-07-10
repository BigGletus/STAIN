extends Node

func ability_decide(ability: Ability, targets: Array[Character] = []) -> Array[String]: ## Returns ability types as a String Array. If targets are given it calls the appropriate functions to cause the abilities effect.
	var types: Array[String]
	for type in ability.ability_types:
		if type == ability.ability_type.DAMAGE:
			types.append("DAMAGE")
			if targets != null:
				ability_damage(ability, targets)
	return types

func ability_damage(ability: Ability, targets: Array[Character]) -> void:
	var damage: int = ability.ability_damage
	if damage > 0:
		for target: Character in targets:
			target.take_damage(damage)

extends Node

func ability_cast(ability: Ability, targets: Array[Character] = []) -> void:
	ability_decide(ability, targets)

func ability_decide(ability: Ability, targets: Array[Character] = []) -> Array[String]: ## Returns ability types as a String Array. If targets are given it calls the appropriate functions to cause the abilities effect.
	var types: Array[String]
	for type in ability.ability_types:
		
		if type == ability.ability_type.BUFF:
			types.append("BUFF")
			if targets != null:
				pass
		
		if type == ability.ability_type.DAMAGE:
			types.append("DAMAGE")
			if targets != null:
				ability_damage(ability, targets)
		
		if type == ability.ability_type.DEBUFF:
			types.append("DEBUFF")
			if targets != null:
				pass
		
		if type == ability.ability_type.HEAL:
			types.append("HEAL")
			if targets != null:
				ability_heal(ability, targets)
		
		if type == ability.ability_type.MOVE:
			types.append("MOVE")
			if targets != null:
				pass
		
	return types

func get_modifiers() -> void:
	pass

func ability_damage(ability: Ability, targets: Array[Character]) -> void: ## Calls the adjust_health function of the target after factoring in any modifiers.
	var damage: int = ability.ability_damage
	if damage > 0:
		for target: Character in targets:
			target.adjust_health(-damage)

func ability_heal(ability: Ability, targets: Array[Character]) -> void: ## Calls the adjust_health function of the target after factoring in any modifiers
	var heal: int = ability.ability_heal
	if heal > 0:
		for target: Character in targets:
			target.adjust_health(heal)

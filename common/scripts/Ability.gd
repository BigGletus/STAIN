extends Resource
class_name Ability

enum ability_type {
	BUFF,
	DAMAGE,
	DEBUFF,
	HEAL,
	MOVE
} ## List of all possible ability types. An ability may have multiple types.

@export var ability_name: String ## Name of ability.
@export var ability_types: Array[ability_type] ## List of all ability type tags.
@export var ability_cooldown: int ## How many turns must pass before the ability can be used again.
@export var ability_damage: int ## How much damage the ability does, if any. Should be left at 0 if the DAMAGE type is not present in ability_types.

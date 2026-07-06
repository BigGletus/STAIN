extends Resource
class_name Stats

enum BuffableStats {
	MAX_HEALTH,
	DEFENSE,
	ATTACK
}

const STAT_CURVES: Dictionary[BuffableStats, Curve] = {BuffableStats.MAX_HEALTH: preload("uid://y41onoxh5l4v")}

signal health_changed(cur_health: int, max_health: int)
signal health_depleted

@export var base_max_health: int = 1
@export var base_defense: int = 10
@export var base_attack: int = 10
@export var experience: int = 0: set = _on_experience_set

var level: int:
	get(): return floor(max(1.0, sqrt(experience / 100) + 0.5))
var current_max_health: int = 1
var current_defense: int = 10
var current_attack: int = 10

var health: int = 0: set = _on_health_set

func _init() -> void:
	setup_stats.call_deferred()

func setup_stats() -> void:
	recalculate_stats()
	health = current_max_health

func recalculate_stats() -> void:
	var stat_sample_pos: float = (float(level)/100.0)-0.01
	current_max_health = base_max_health * STAT_CURVES[BuffableStats.MAX_HEALTH].sample(stat_sample_pos)

func _on_health_set(new_value: int) -> void:
	health = clampi(new_value, 0, current_max_health)
	health_changed.emit(health, current_max_health)
	if health <= 0:
		health_depleted.emit()

func _on_experience_set(new_value: int) -> void:
	var old_level: int = level
	experience = new_value
	
	if not old_level == level:
		recalculate_stats()

extends Character

@export var level: int
var xp: int
var stain: int
var stain_xp: int

var att_might: int
var att_agility: int
var att_resolve: int
var att_reason: int
var att_presence: int

var att_health: int
var att_mental: int #mental is placeholder name for fear/stress/morale
var att_toughness: int 
var att_willpower: int
var att_evasion: int
var att_innocence: int #innocence is placeholder name for holiness/virtue
var att_allure: int

func _ready():
	maximum_hp = att_health
	att_health = maximum_hp
	print(maximum_hp)

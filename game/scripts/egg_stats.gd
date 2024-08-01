extends Resource

class_name EggStats

@export var health: int
@export var rarity: Rarity
@export var hatchtime: float

enum Rarity {
	UNDEFINED,
	COMMON,
	UNCOMMON,
	RARE,
	ULTRARARE,
	LEGENDARY
}


func _init(p_health = 10, p_rarity = Rarity.UNDEFINED, p_hatchtime = 100):
	health = p_health
	rarity = p_rarity
	hatchtime = p_hatchtime

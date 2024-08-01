extends Resource

class_name EggStats

@export var health: int
@export var rarity: Rarity

enum Rarity {
	UNDEFINED,
	COMMON,
	UNCOMMON,
	RARE,
	ULTRARARE,
	LEGENDARY
}

func _init(p_health = 0, p_rarity = Rarity.UNDEFINED):
	health = p_health
	rarity = p_rarity

extends Node2D

@export var stats: EggStats

# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	var random_number= rng.randi_range(1, EggStats.Rarity.size() -1)
	if (stats):
		stats.rarity = EggStats.Rarity.values()[random_number]
		stats.health = 10 * random_number
		print(stats.rarity)
		print(stats.health) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

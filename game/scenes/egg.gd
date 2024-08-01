extends Node2D

@export var stats: EggStats

# Called when the node enters the scene tree for the first time.
func _ready():
	if (stats):
		stats.health = 10
		stats.rarity = EggStats.Rarity.COMMON
		print(stats.rarity) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

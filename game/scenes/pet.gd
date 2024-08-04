extends Node2D

@export var stats: MonsterStats
@export var rarity: EggStats.Rarity

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _init(stats: EggStats, position):
	self.position = position
	self.stats = MonsterStats.new()
	calculateStats(stats)
	
	

func calculateStats(eggStats: EggStats):
	self.rarity = eggStats.rarity
	stats.health = eggStats.health * eggStats.rarity

extends Pickupable

class_name Pet

@export var stats: MonsterStats
@export var rarity: EggStats.Rarity

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateLocation()
	print("hello")


func initalize(stats: EggStats, position):
	print("init!")
	self.position = position
	self.stats = MonsterStats.new()
	calculateStats(stats)
	
	

func calculateStats(eggStats: EggStats):
	self.rarity = eggStats.rarity
	stats.health = eggStats.health * eggStats.rarity



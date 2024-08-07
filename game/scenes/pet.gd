extends Pickupable

class_name Pet

@export var stats: MonsterStats
@export var rarity: EggStats.Rarity
@onready var name_label = $Panel/nameLabel
@onready var stats_panel = $StatsPanel



# Called when the node enters the scene tree for the first time.
func _ready():
	name_label.text = stats.name
	update_stats_label()

func update_stats_label():
	var container = stats_panel.get_child(0)
	container.get_child(0).text = container.get_child(0).text + str(stats.health)
	container.get_child(1).text = container.get_child(1).text + str(stats.defence)
	container.get_child(2).text = container.get_child(2).text + str(stats.attack)
	container.get_child(3).text = container.get_child(3).text + str(stats.specialAttack)
	container.get_child(4).text = container.get_child(4).text + str(stats.speed)
	if(stats.gender == 0):
		container.get_child(5).text = container.get_child(5).text + "MALE"
	else:
		container.get_child(5).text = container.get_child(5).text + "FEMALE"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):


	updateLocation()

	if(isPicked):
		stats_panel.visible = true
	else:
		stats_panel.visible = false



func initalize(eggStats: EggStats, position):
	print("init!")
	self.position = position
	self.stats = MonsterStats.new()
	calculateStats(eggStats)
	PlayerVariables.Pets["pet"+str(PlayerVariables.Pets.size())] = self
	PlayerVariables.save()



func calculateStats(eggStats: EggStats):
	self.rarity = eggStats.rarity
	stats.health = eggStats.health * eggStats.rarity



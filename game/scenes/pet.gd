extends Pickupable

class_name Pet

@export var stats: MonsterStats
@export var rarity: EggStats.Rarity
@onready var name_label = $Panel/nameLabel
@onready var stats_panel = $StatsPanel



# Called when the node enters the scene tree for the first time.
func _ready():
	name_label.text = stats._name
	update_stats_label()

func update_stats_label():
	var container = stats_panel.get_child(0)
	container.get_child(0).text = container.get_child(0).text + str(stats._health)
	container.get_child(1).text = container.get_child(1).text + str(stats._defence)
	container.get_child(2).text = container.get_child(2).text + str(stats._attack)
	container.get_child(3).text = container.get_child(3).text + str(stats._specialAttack)
	container.get_child(4).text = container.get_child(4).text + str(stats._speed)
	if(stats._gender == 0):
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
	var stringedData = convertPetToString(self)
	PlayerVariables.Pets["pet"+str(PlayerVariables.Pets.size())] = stringedData
	PlayerVariables.save()



func calculateStats(eggStats: EggStats):
	self.rarity = eggStats.rarity
	stats._health = eggStats.health * eggStats.rarity

func convertPetToString(obj: Pet): 
	var result = "pet"+str(PlayerVariables.Pets.size())+":\n"
	var property_list = obj.stats.get_property_list()
	
	for property in property_list:
		var property_name = property["name"]
		
		if property_name.begins_with("_"):
			var value = obj.stats.get(property_name)
			result += "%s: %s\n" % [property_name, str(value)]
		
	return result+"----------------------------\n"

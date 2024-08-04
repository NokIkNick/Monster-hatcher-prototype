extends Node2D

@export var stats: EggStats
@onready var hatchtimer = $Hatchtimer
@onready var isHatched = false
@onready var hatching = false
const Pet = preload("res://scenes/pet.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	var rarity_number = rng.randi_range(1, EggStats.Rarity.size() -1)
	if (stats):
		calculateStats(rarity_number)
		hatchtimer.start()
		hatching = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(hatching):
		print(hatchtimer.time_left)
	
	if(hatchtimer.is_stopped() && hatching && !isHatched):
		hatch()
		

func calculateStats(rarity_nr):
	stats.rarity = EggStats.Rarity.values()[rarity_nr]
	stats.health = 10 * rarity_nr
	hatchtimer.wait_time = 5
	#hatchtimer.wait_time = stats.hatchtime * rarity_nr

func hatch():
	print("hatched!")
	hatching = false
	isHatched = true
	get_tree().queue_delete(self)
	Pet.new(stats, self.position)

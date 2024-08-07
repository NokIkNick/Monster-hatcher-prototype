extends Pickupable

@export var stats: EggStats
@onready var hatchtimer = $Hatchtimer
@onready var isHatched = false
@onready var hatching = false
@onready var game = $".."
@onready var timer_text = $Panel/TimerText


const PET = preload("res://scenes/pet.tscn")

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
	timer_text.text = format_timer_to_two_digits(hatchtimer.time_left)
	
	#from the pickupable class
	updateLocation()
	
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
	var obj = PET.instantiate()
	obj.initalize(stats, self.position)
	game.add_child(obj)
	obj.position = self.position
	get_tree().queue_delete(self)
	

func format_timer_to_two_digits(time: float) -> String:
	# Convert the float to an integer
	var time_int = int(time)
	var formatted_time = "%02d" % time_int
	return formatted_time


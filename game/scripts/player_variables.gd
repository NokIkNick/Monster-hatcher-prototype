extends Node

var Pets = {}
var petThatIsBeingHeld: Pickupable

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(petThatIsBeingHeld):
		print(petThatIsBeingHeld.name)
		print(petThatIsBeingHeld.isPicked)

func loadGame():
	var content = load_file()
	print(content)

func save():
	save_file(Pets)

func save_file(content):
	var file = FileAccess.open("res://data/playerdata.json", FileAccess.WRITE)
	var dataToSave = JSON.stringify(content)
	file.store_string(dataToSave)
	
	

func load_file():
	var file = FileAccess.open("res://data/playerdata.json", FileAccess.READ)
	if(!file):
		pass
	
	var content = file.get_as_text()
	
	if(!content):
		pass
	
	var toReturn = JSON.parse_string(content)
	if(toReturn == null):
		pass

	return toReturn

extends Node

var Pets = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func loadGame():
	var content = load_file()
	print(content)

func save():
	save_file(Pets)

func save_file(content):
	var file = FileAccess.open("res://data/playersave.txt", FileAccess.WRITE)
	var dataToSave = JSON.stringify(content)
	file.store_string(dataToSave)
	
	

func load_file() -> Dictionary:
	var file = FileAccess.open("res://data/playersave.txt", FileAccess.READ)
	var content = file.get_as_text()
	var toReturn = JSON.parse_string(content)
	return toReturn

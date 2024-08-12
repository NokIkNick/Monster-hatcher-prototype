extends Node2D
@onready var buy_egg_button = $BuyEggButton
const EGG = preload("res://scenes/egg.tscn")
@onready var game = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	buy_egg_button.pressed.connect(self.spawnEgg)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawnEgg():
	var newEgg = EGG.instantiate()
	game.add_child(newEgg)
	var rng = RandomNumberGenerator.new()
	newEgg.position = Vector2(rng.randi_range(10,20), rng.randi_range(10,20))

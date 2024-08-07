extends Node2D

class_name Pickupable

var isPicked = false

func updateLocation():
	if(isPicked):
		self.position = get_global_mouse_position()

func _on_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton and event.is_action_pressed("click")):
		self.isPicked = !isPicked

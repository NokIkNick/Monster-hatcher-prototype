extends Node2D

class_name Pickupable

var isPicked = false

func updateLocation():
	if(self.isPicked && PlayerVariables.petThatIsBeingHeld == self):
		self.position = get_global_mouse_position()

func _on_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton and event.is_action_pressed("click")):
		if(PlayerVariables.petThatIsBeingHeld == self && self.isPicked):
			PlayerVariables.petThatIsBeingHeld = null;
			isPicked = false
		elif(PlayerVariables.petThatIsBeingHeld != self && !self.isPicked):
			PlayerVariables.petThatIsBeingHeld = self
			isPicked = true

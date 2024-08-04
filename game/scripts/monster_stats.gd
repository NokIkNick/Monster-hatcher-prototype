extends Resource

class_name MonsterStats

@export var name: String
@export var nickName: String
@export var health: int
@export var defence: int
@export var attack: int
@export var specialAttack: int
@export var speed: int
@export var gender: Gender

enum Gender {
	MALE,
	FEMALE
}
 

func _init(name_ = "unnamed" , nickName_ = "unnamed", health_ = 10, defence_ = 10, attack_ = 10, specialAttack_ = 10, speed_ = 10, gender_ = Gender.MALE):
	self.name = name_
	self.nickName = nickName_
	self.health = health_
	self.defence = defence_
	self.attack = attack_
	self.specialAttack = specialAttack_
	self.speed = speed_
	self.gender = gender_
	

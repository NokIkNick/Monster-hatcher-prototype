extends Resource

class_name MonsterStats

@export var _name: String
@export var _nickName: String
@export var _health: int
@export var _defence: int
@export var _attack: int
@export var _specialAttack: int
@export var _speed: int
@export var _gender: _Gender

enum _Gender {
	MALE,
	FEMALE
}
 

func _init(name_ = "unnamed" , nickName_ = "unnamed", health_ = 10, defence_ = 10, attack_ = 10, specialAttack_ = 10, speed_ = 10, gender_ = _Gender.MALE):
	self._name = name_
	self._nickName = nickName_
	self._health = health_
	self._defence = defence_
	self._attack = attack_
	self._specialAttack = specialAttack_
	self._speed = speed_
	self._gender = gender_
	

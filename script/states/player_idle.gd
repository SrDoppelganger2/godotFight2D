extends State
class_name PlayerIdle

@export var player: CharacterBody2D;
@export var sprite: Sprite2D;

@onready var right = player.getControls("RIGHT");
@onready var left = player.getControls("LEFT");
@onready var up = player.getControls("UP");
@onready var down = player.getControls("DOWN");

#variaveis para entrar no estado de pulo/aereo
var wantJump:bool;
var isJumping: bool;

func Enter():
	sprite.self_modulate = Color("green");
	
func Physics_Update(delta: float):
	wantJump = Input.is_action_just_pressed(up) and player.is_on_floor();
	isJumping = not player.is_on_floor();
	
	if wantJump or isJumping:
		Transitioned.emit(self,"air");
	
	if Input.is_action_pressed(right) or Input.is_action_pressed(left):
		Transitioned.emit(self,"move");
	
	if Input.is_action_just_pressed(up):
		Transitioned.emit(self,"air");

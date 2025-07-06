extends State
class_name PlayerIdle

@export var player: CharacterBody2D;
@export var sprite: Sprite2D;

#Inputs de Movimento
@onready var right = player.getControls("RIGHT");
@onready var left = player.getControls("LEFT");
@onready var up = player.getControls("UP");
@onready var down = player.getControls("DOWN");

#Inputs de Ataque
@onready var light = player.getControls("L");
@onready var medium = player.getControls("M");
@onready var strong = player.getControls("S");

#var de animação
@onready var animation: AnimationPlayer = $"../../Animations/AnimationPlayer"

#variaveis para entrar no estado de pulo/aereo
var wantJump:bool;
var isJumping: bool;

func Enter():
	sprite.self_modulate = Color("green");
	animation.play("idle")
	
func Physics_Update(delta: float):
	wantJump = Input.is_action_just_pressed(up) and player.is_on_floor();
	isJumping = not player.is_on_floor();
	
	if wantJump or isJumping:
		Transitioned.emit(self,"air");
	
	if Input.is_action_pressed(right) or Input.is_action_pressed(left):
		Transitioned.emit(self,"move");
	
	if Input.is_action_just_pressed(up):
		Transitioned.emit(self,"air");
	
	#todo achar um jeito melhor de detectar se o jogador está atacando
	if Input.is_action_just_pressed(light):
		Transitioned.emit(self,"attack");
	
	if Input.is_action_just_pressed(medium):
		Transitioned.emit(self,"attack");
	
	if Input.is_action_just_pressed(strong):
		Transitioned.emit(self,"attack");

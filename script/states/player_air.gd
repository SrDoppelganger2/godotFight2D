extends State

@export var player: CharacterBody2D;
@export var sprite: Sprite2D;

const SPEED = 200.0

@export_category("Jump Params")
@export var jump_peak_time:float = 0.5;
@export var jump_fall_time:float = 0.5;
@export var jump_height:float = 20.0;
@export var jump_distance:float = 40.0;
#não precisa de valores default, só coloquei para evitar erros
var speed: float = 5.0;
var jump_velocity: float = 5.0;

#variaveis de gravidade
var jump_gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity");
var fall_gravity: float;

func calculateMovement():
	#equação de movimento vertical e de queda-livre
	jump_gravity = (2*jump_height)/pow(jump_peak_time,2);
	fall_gravity = (2*jump_height)/pow(jump_fall_time,2);
	jump_velocity = jump_gravity * jump_peak_time;
	speed = jump_distance/(jump_peak_time + jump_fall_time);

var input: Vector2;
@onready var right = player.getControls("RIGHT");
@onready var left = player.getControls("LEFT");
@onready var up = player.getControls("UP");
@onready var down = player.getControls("DOWN");

func getInput():
	#TODO botar input de pulo aq tbm(?)
	input.x = Input.get_action_strength(right) - Input.get_action_strength(left);
	return input.x;

func Enter():
	sprite.self_modulate = Color("purple");
	calculateMovement()
	player.velocity.y = -jump_velocity
	print(jump_velocity)
	
func Physics_Update(delta: float):
	var direction = getInput();
	player.velocity.x = direction * SPEED;
	
	if not player.is_on_floor():
		if player.velocity.y > 0:
			player.velocity.y += jump_gravity * delta;
		else:
			player.velocity.y += fall_gravity * delta;
	
	if Input.is_action_just_pressed(up) and player.is_on_floor():
		player.velocity.y = jump_velocity
	
	if player.is_on_floor():
		Transitioned.emit(self,"idle");

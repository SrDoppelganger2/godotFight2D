extends State

@export var player: CharacterBody2D;
@export var sprite: Sprite2D;

const JUMP_VELOCITY = -800.0;
const SPEED = 200.0;

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
	if Input.is_action_just_pressed(up):
		player.velocity.y = JUMP_VELOCITY
	
func Physics_Update(delta: float):
	var direction = getInput();
	player.velocity.x = direction * SPEED;
	
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta;
	
	if Input.is_action_just_pressed(up) and player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY
	
	if player.is_on_floor():
		Transitioned.emit(self,"idle");

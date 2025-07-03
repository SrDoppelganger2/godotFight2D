extends State

@export var sprite: Sprite2D;
@export var player: CharacterBody2D;

const SPEED = 400.0

var input: Vector2;

@onready var right = player.getControls("RIGHT");
@onready var left = player.getControls("LEFT");
@onready var up = player.getControls("UP");
@onready var down = player.getControls("DOWN");

func getInput():
	input.x = Input.get_action_strength(right) - Input.get_action_strength(left);
	return input.normalized();


func Enter():
	sprite.self_modulate = Color("orange");

func Physics_Update(delta: float):
	var direction = getInput();
	player.velocity = direction * SPEED;
	
	if not player.is_on_floor():
		Transitioned.emit(self,"air");
	
	if Input.is_action_just_pressed(up):
		Transitioned.emit(self,"air");
	
	if direction == Vector2(0,0):
		Transitioned.emit(self,"idle");

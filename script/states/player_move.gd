extends State

@export var sprite: Sprite2D;
@export var player: CharacterBody2D;

const SPEED = 200.0

var input: Vector2;

#pegar a direcão que o jogador está olhando
#var de blocking
@onready var playerDirection; 

@onready var right = player.getControls("RIGHT");
@onready var left = player.getControls("LEFT");
@onready var up = player.getControls("UP");
@onready var down = player.getControls("DOWN");

#var de animação
@onready var animation: AnimationPlayer = $"../../Animations/AnimationPlayer"

func getInput():
	input.x = Input.get_action_strength(right) - Input.get_action_strength(left);
	return input.normalized();


func Enter():
	sprite.self_modulate = Color("orange");
	animation.play("forward");
	
func Physics_Update(delta: float):
	var direction = getInput();
	player.velocity = direction * SPEED;
	
	playerDirection = player.getFacingDirection()
	
	if direction.x == -playerDirection:
		player.setBlocking(true);
		#colocar coisas de charge input aq ;3
	else:
		player.setBlocking(false);
	
	if not player.is_on_floor():
		Transitioned.emit(self,"air");
	
	if Input.is_action_just_pressed(up):
		Transitioned.emit(self,"air");
	
	if Input.is_action_just_pressed(down):
		Transitioned.emit(self,"crouch");
	
	if direction == Vector2(0,0):
		Transitioned.emit(self,"idle");

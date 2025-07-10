extends State

@onready var player: CharacterBody2D = $"../.."
@onready var sprite: Sprite2D = $"../../Sprite2D"
@onready var animation: AnimationPlayer = $"../../Animations/AnimationPlayer"

#var de hurtbox
@onready var hurtbox: CollisionShape2D = $"../../CollisionShape2D"

#Inputs de movimento (os outros inputs são importantes para charge inputs dps)
@onready var right = player.getControls("RIGHT");
@onready var left = player.getControls("LEFT");
@onready var up = player.getControls("UP");
@onready var down = player.getControls("DOWN");

var input:Vector2;

var playerDirection;

#func para saber se o jogador está bloqueando
func getInput():
	input.x = Input.get_action_strength(right) - Input.get_action_strength(left);
	return input.normalized();


func Enter():
	sprite.self_modulate = Color("pink");
	player.velocity.x = 0; 
	animation.play("crouch");
	
func Update(delta:float):
	if !Input.is_action_pressed(down):
		Transitioned.emit(self,"idle");

func Physics_Update(delta:float):
	playerDirection = player.getFacingDirection()
	var direction = getInput();
	
	if direction.x == -playerDirection:
		player.setBlocking(true);
		#colocar coisas de charge input aq ;3
	else:
		player.setBlocking(false);

func Exit():
	hurtbox.scale = Vector2(1,1);
	hurtbox.position.y = 7.0;

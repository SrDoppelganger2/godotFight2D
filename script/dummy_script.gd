extends CharacterBody2D

@export var rival:CharacterBody2D;
@onready var sprite: Sprite2D = $Sprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0

var input: Vector2;

func getInput():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
	return input.x;

func _process(delta: float) -> void:
	#deixa o personagem virado para o inimigo
	if rival.global_position.x > global_position.x:
		sprite.scale.x = 1;
	else:
		sprite.scale.x = -1;

#essa entidade é um placeholder que dps será substituido por outra instancia da classe jogador
func _physics_process(delta: float) -> void:	
	if not is_on_floor():
		velocity += get_gravity() * delta;
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction = getInput();
	velocity.x = direction * SPEED;
	
	
	move_and_slide()

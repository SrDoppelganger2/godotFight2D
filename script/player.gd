extends CharacterBody2D

@export var health = 10;

@export var rival: CharacterBody2D;
@onready var sprite: Sprite2D = $Sprite2D

@export var UP:String = "";
@export var DOWN:String = "";
@export var LEFT:String = "";
@export var RIGHT:String = "";

#TODO refazer esse sistema de controles
func getControls(input):
	match input:
		"UP":
			return UP;
		"DOWN":
			return DOWN;
		"LEFT":
			return LEFT;
		"RIGHT":
			return RIGHT

func getHealth():
	return health;
	
#para teste
func getHurt(damage:int):
	health = health - damage

func _process(delta: float):
	
	#deixa o personagem virado para o inimigo
	if rival.global_position.x > global_position.x:
		sprite.scale.x = 1;
	else:
		sprite.scale.x = -1;

func _physics_process(delta: float) -> void:
	move_and_slide()

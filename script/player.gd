extends CharacterBody2D

@export var health = 10;
var blocking:bool = false;

@export var rival: CharacterBody2D;
@onready var sprite: Sprite2D = $Sprite2D
@onready var hitbox: Area2D = $Hitbox

#TODO achar um jeito mais efetivo de fazer isso
var direction = 1.0;

@export var UP:String = "";
@export var DOWN:String = "";
@export var LEFT:String = "";
@export var RIGHT:String = "";

#Inputs de ataque (Light,Medium,Strong)
@export var L:String = "";
@export var M:String = "";
@export var S:String = "";

#TODO refazer esse sistema de controles
#TODO achar um jeito melhor de compartilhar essas variáveis
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
		"L":
			return L
		"M":
			return M
		"S":
			return S

func getHealth():
	return health;
	
#para teste
func getHurt(damage:int):
	if blocking:
		#provisório, pensar no balanceamento dps
		health = health - 1
	else:
		health = health - damage

func getFacingDirection():
	return direction;

func setBlocking(value:bool):
	blocking = value;

func _process(_delta: float):
	
	#deixa o personagem virado para o inimigo
	if rival.global_position.x > global_position.x:
		sprite.scale.x = 1;
		hitbox.scale.x = 1;
		direction = 1.0; #1.0 = olhando para direita
	else:
		sprite.scale.x = -1;
		hitbox.scale.x = -1;
		direction = -1.0 #-1.0 = olhando para a esquerda
		

func _physics_process(delta: float) -> void:
	move_and_slide()

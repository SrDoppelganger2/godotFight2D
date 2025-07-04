extends Control

#pega todos os jogadores na cena
@onready var playerList = get_tree().get_nodes_in_group("Players");

@onready var P1health: Label = $P1_health;
@onready var P2health: Label = $P2_health;
var player1;
var player2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player1 = playerList[0];
	player2 = playerList[1];

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	P1health.text = "Player 1: " + str(player1.getHealth());
	P2health.text = "Player 1: " + str(player2.getHealth());

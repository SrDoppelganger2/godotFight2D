extends Node2D

@onready var meme: AudioStreamPlayer2D = $Sounds/meme_intro



# nem sei se esse script vai ser util pra alguma coisa, fiz puramente pelo meme
func _ready() -> void:
	meme.play();

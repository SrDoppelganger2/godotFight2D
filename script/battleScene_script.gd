extends Node2D

@onready var meme: AudioStreamPlayer2D = $Sounds/meme_intro


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	meme.play();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends State

@export var player: CharacterBody2D;
@export var sprite: Sprite2D;

@onready var animation: AnimationPlayer = $"../../Animations/AnimationPlayer"

@onready var light = player.getControls("LP");

func Enter():
	sprite.self_modulate = Color("red");

func Update(delta):
	if Input.is_action_just_pressed(light):
		animation.play("light_Attack");
	
#muda de estado quando a animação acaba
func _on_animation_finished(_anim_name: StringName) -> void:
	Transitioned.emit(self,"idle");

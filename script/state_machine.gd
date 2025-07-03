extends Node
#Esse script pode ser reutilizado para qualquer script que usar um state machine

#Guarda todos estados com a classe State (que herda de state.gd)
var states: Dictionary = {}

#Estado inicial
@export var initial_state: State;

#Estado atual
var current_state: State;

func _ready() -> void:
	#loop que add os sub-nós que servirão como estados
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			#Se o sinal "Transitioned" for emitido pelo estado, ele chama a func "on_child_transition"
			child.Transitioned.connect(on_child_transition);
	
	#Inicia a entidade com seu estado inicial
	if initial_state:
		initial_state.Enter();
		current_state = initial_state;

func _process(delta: float) -> void:
	#Executa o método Update do estado atual
	if current_state:
		current_state.Update(delta);

func _physics_process(delta: float) -> void:
	#msm esquema de _process só que para Physics_Update
	if current_state:
		current_state.Physics_Update(delta);
	

#função responsável pela transição de estados, recebe o estado atual e o estado que será transicionado
func on_child_transition(state,new_state_name):
	if state != current_state:
		return
	
	#procura o estado nos sub-nós, e se ele não existir, retorna
	var new_state = states.get(new_state_name.to_lower());
	if !new_state:
		return
	
	#sai do estado atual
	if current_state:
		current_state.Exit();
	
	#Entra na nova função
	new_state.Enter();
	
	#Nova função vira o estado atual
	current_state = new_state;

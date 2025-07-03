extends Node
class_name State

signal Transitioned

#OBS: esse script serve como classe abstrata para outros estados herdarem

#funciona como um _ready()
func Enter():
	pass

#funciona como um _process()
func Update(delta: float):
	pass

#funciona como um _physics_process()
func Physics_Update(delta: float):
	pass

#É chamada quando a entidade sai do estado
func Exit():
	pass

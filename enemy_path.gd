extends Path3D

@export var enemy_sceme: PackedScene


func spawn_enemy() -> void:
	var new_enemy = enemy_sceme.instantiate()
	add_child(new_enemy)

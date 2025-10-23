extends Node3D

@export var projectile: PackedScene
@onready var turret_barrel_ring: MeshInstance3D = $TurretBase/TurretTop/TurretBarrel3/TurretBarrelRing

func _on_timer_timeout() -> void:
	var shot = projectile.instantiate()
	add_child(shot)
	shot.global_position = turret_barrel_ring.global_position

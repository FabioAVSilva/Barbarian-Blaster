extends Node3D

@export var projectile: PackedScene
@export var turret_range := 10.0

var enemy_path: Path3D
var target: PathFollow3D

@onready var turret_barrel_ring: MeshInstance3D = $TurretBase/TurretTop/Node3D/TurretTriangleBarrelBase/TurretBarrel3/TurretBarrelRing
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target:
		look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target:
		var shot = projectile.instantiate()
		add_child(shot)
		shot.global_position = turret_barrel_ring.global_position
		shot.direction = global_transform.basis.z
		animation_player.play("fire")
	
func find_best_target() -> PathFollow3D:
	var best_target = null
	var highest_progress = 0
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D:
			var distance = global_position.distance_to(enemy.global_position)
			if enemy.progress > highest_progress && distance <= turret_range:
				best_target = enemy
				highest_progress = enemy.progress
				
	return best_target

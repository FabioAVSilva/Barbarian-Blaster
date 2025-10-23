extends Area3D

var direction := Vector3.FORWARD

@export var speed := 30.0

func _physics_process(delta: float) -> void:
	position += direction * delta * speed


func _on_timer_timeout() -> void:
	queue_free()

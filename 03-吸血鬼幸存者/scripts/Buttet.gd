extends Area2D

var speed: float = 1000.0
var travelled_distance:float = 0
var max_travelled_distance: float = 1000.0

func _physics_process(delta: float) -> void:
	# 旋转子弹的角度
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	
	if travelled_distance > max_travelled_distance:
		queue_free()
	pass


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_health"):
		body.take_health()
	pass # Replace with function body.

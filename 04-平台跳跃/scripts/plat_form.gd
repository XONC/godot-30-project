extends AnimatableBody2D

## 是否可移动的平台
@export var disabled_move:bool = true 
@export var speed: float = 50.0


@onready var ray_cast: RayCast2D = $RayCast2D

var direction:int = 1

func _physics_process(delta: float) -> void:
	
	if ray_cast.is_colliding():
		direction = -direction
		ray_cast.target_position = -ray_cast.target_position
	
	if disabled_move:
		position.x += speed * direction * delta
		pass
	
	pass

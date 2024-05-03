extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var move_up:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if move_up:
		position.y -= 24 * delta
	pass


func _on_body_entered(body: Node2D) -> void:
	move_up = true
	animation_player.play("get_coin")
	GameGlobal.set_coin()
	pass # Replace with function body.

func remove_coin() -> void:
	queue_free()
	pass

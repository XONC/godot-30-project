extends CharacterBody2D

@export var tag = 'player'

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var camera_2d: Camera2D = $Camera2D
@onready var death_zoom: Area2D = %DeathZoom

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	camera_2d.limit_bottom = death_zoom.position.y

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction := Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("jump")
		audio_stream_player.play()
	
	if is_on_floor():
		if direction:
			animated_sprite.flip_h = not direction == 1
			animated_sprite.play("running")
		else:
			animated_sprite.play("idle")		
	
	
	move_and_slide()

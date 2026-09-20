extends CharacterBody2D

const SPEED := 160.0
const JUMP_VELOCITY := -340.0
const GRAVITY := 900.0
const DEATH_Y := 600.0

var respawn_position: Vector2

@onready var Sprite: Node2D = $Sprite

func _ready() -> void:
	respawn_position = global_position

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var dir := Input.get_axis("move_left", "move_right")
	velocity.x = dir * SPEED
	if dir != 0:
		Sprite.scale.x = 1 if dir > 0 else -1
	move_and_slide()
	if global_position.y > DEATH_Y:
		die()

func die() -> void:
	global_position = respawn_position
	velocity = Vector2.ZERO

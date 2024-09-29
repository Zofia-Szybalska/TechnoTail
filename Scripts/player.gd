extends CharacterBody2D
class_name Player

@export var walking_speed: float = 1000
@export var walking_accel: float = 250
@onready var animation_tree = $AnimationTree

func _physics_process(_delta):
	var directions: Vector2 = Input.get_vector("left", "right", "up", "down")
	update_animation_parameters(directions)
	
	velocity.x = move_toward(velocity.x, walking_speed * directions.x, walking_accel)
	velocity.y = move_toward(velocity.y, walking_speed * directions.y, walking_accel)
	
	move_and_slide()

func update_animation_parameters(directions: Vector2):
	animation_tree["parameters/blend_position"] = directions

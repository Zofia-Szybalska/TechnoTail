extends Node2D

var player_near: bool = false
@export var item: Item = null
@onready var sprite_2d = $Sprite2D

func _ready():
	sprite_2d.texture = item.sprite

func _process(_delta):
	if player_near and Input.is_action_just_pressed("interaction"):
		PlayerStats.add_item(item)
		queue_free()


func _on_area_2d_body_entered(body):
	if body is Player:
		player_near = true


func _on_area_2d_body_exited(body):
	if body is Player:
		player_near = false

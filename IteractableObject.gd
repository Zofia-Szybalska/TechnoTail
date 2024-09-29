extends StaticBody2D

var player_near = false
@export var item_needed: Item
@onready var inventory = $CanvasLayer/inventory

func _ready():
	inventory.needed_item = item_needed

func _process(_delta):
	if player_near and Input.is_action_just_pressed("interaction"):
		inventory.show_inventory()

func _on_area_2d_body_entered(body):
	if body is Player:
		player_near = true

func _on_area_2d_body_exited(body):
	if body is Player:
		player_near = false

extends Node2D
@onready var inventory = $CanvasLayer/inventory



func _ready():
	PlayerStats.add_item(load("res://Resources/Items/cabel.tres"))
	PlayerStats.add_item(load("res://Resources/Items/wire.tres"))
	PlayerStats.add_item(load("res://Resources/Items/battery.tres"))
	PlayerStats.add_item(load("res://Resources/Items/pipe.tres"))

func _process(_delta):
	if Input.is_action_just_pressed("inventory"):
		get_tree().paused = !get_tree().paused
		inventory.visible = !inventory.visible
		inventory.show_inventory()

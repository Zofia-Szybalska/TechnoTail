extends MarginContainer

@onready var grid_container = %GridContainer
@onready var item_cell = preload("res://Scenes/item.tscn")

var item_selected = false
var selected_item: Item = null
@export var needed_item: Item

func _on_item_clicked(item: Item):
	item_selected = true
	selected_item = item

func show_inventory():
	get_tree().paused = true
	visible = true
	for item in PlayerStats.items:
		var instanced_item = item_cell.instantiate()
		instanced_item.item_resource = item
		grid_container.add_child(instanced_item)
		instanced_item.item_clicked.connect(_on_item_clicked)

func hide_inventory():
	get_tree().paused = false
	visible = false
	for item in grid_container.get_children():
		grid_container.remove_child(item)

func _on_button_pressed():
	hide_inventory()

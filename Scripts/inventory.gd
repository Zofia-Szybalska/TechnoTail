extends MarginContainer

@onready var grid_container = %GridContainer
@onready var item_cell = preload("res://Scenes/item.tscn")
@onready var error_label = $"Panel conteiner/VBoxContainer/ErrorLabel"
@onready var label: Label = $"Panel conteiner/VBoxContainer/MarginContainer/Label"

var item_selected = false
var selected_item: Item = null
@export var needed_item: Item
signal item_used
var item_inserted: bool = false

func _ready():
	for item in PlayerStats.items:
		var instanced_item = item_cell.instantiate()
		instanced_item.item_resource = item
		grid_container.add_child(instanced_item)
		instanced_item.item_clicked.connect(_on_item_clicked)

func show_inventory():
	get_tree().paused = true
	visible = true
	if item_inserted:
		label.text = "You have fixed this already!"
	else:
		for item in PlayerStats.items:
			var instanced_item = item_cell.instantiate()
			instanced_item.item_resource = item
			grid_container.add_child(instanced_item)
			instanced_item.item_clicked.connect(_on_item_clicked)

func _on_item_clicked(item: Item):
	item_selected = true
	selected_item = item
	error_label.hide()

func hide_inventory():
	get_tree().paused = false
	visible = false
	for item in grid_container.get_children():
		grid_container.remove_child(item)

func show_error(error_message: String):
	error_label.text = error_message
	error_label.show()

func use_item():
	hide_inventory()
	item_used.emit()
	PlayerStats.remove_item(needed_item)
	item_inserted = true

func _on_submit_button_pressed():
	if item_selected:
		if selected_item.name == needed_item.name:
			use_item()
		else:
			show_error("That's a wrong item!")
	else:
		show_error("Please choose an item")

func _on_button_pressed():
	hide_inventory()

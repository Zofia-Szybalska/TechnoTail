extends PanelContainer

@export var item_resource: Item
@onready var text_rect = $VBoxContainer/textRect
@onready var label = $VBoxContainer/Label
var mouse_on: bool = false
signal item_clicked

func _ready():
	text_rect.texture = item_resource.sprite
	label.text = item_resource.name
	tooltip_text = item_resource.description


func _process(_delta):
	if mouse_on and Input.is_action_just_pressed("select"):
		item_clicked.emit(item_resource)

func _on_mouse_entered():
	mouse_on = true

func _on_mouse_exited():
	mouse_on = false

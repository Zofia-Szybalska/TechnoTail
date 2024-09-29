extends Node
class_name PlayerStatistics

@export var items: Array[Item] = []


func add_item(item:Item):
	items.append(item)

func remove_item(item:Item):
	items.erase(item)

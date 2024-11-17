extends Node

# nodes here
@onready var suitcase_ui: ReferenceRect = $suitcase_texture_ref
@onready var grid_container: GridContainer = $items_view/GridContainer
@onready var scroll_container: ScrollContainer = $items_view

# init variables here
var inventory = false

func add_items_to_grid() -> void:
	var all_items = {
		"red" : preload("res://assets/16x16_test_images/red.png"),
		"orange" : preload("res://assets/16x16_test_images/orange.png"),
		"yellow" : preload("res://assets/16x16_test_images/yellow.png"),
		"green" : preload("res://assets/16x16_test_images/green.png"),
		"light_blue" : preload("res://assets/16x16_test_images/light_blue.png"),
		"dark_blue" : preload("res://assets/16x16_test_images/dark_blue.png"),
		"purple" : preload("res://assets/16x16_test_images/purple.png"),
		"magenta" : preload("res://assets/16x16_test_images/magenta.png")
	}
	var user_items = ["red", "orange", "yellow", "red", "red", "red", "red", "red", "red", "red", "red", "red", "red", "red", "red", "red"]
	for item in user_items:
		if item not in all_items:
			print("'%s' not found in all_items" % item)
		else:
			var image = TextureRect.new()
			image.texture = all_items[item]
			
			grid_container.add_child(image)

func clear_items_in_grid() -> void:
	for child in grid_container.get_children():
		child.queue_free()
		
		
func _ready() -> void:
	suitcase_ui.visible = false
	
	# make ugly scrollbar disappear
	scroll_container.get_v_scroll_bar().modulate.a = 0

func _process(_delta: float) -> void:
	if (inventory == false) and (Input.is_action_just_pressed("toggle_inventory")):
		add_items_to_grid()
		suitcase_ui.visible = true
		inventory = true
	elif (inventory == true) and (Input.is_action_just_pressed("toggle_inventory")):
		clear_items_in_grid()
		suitcase_ui.visible = false
		inventory = false
		
		
		
		
		
		

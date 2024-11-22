extends Node

# nodes here
@onready var suitcase_ui: ReferenceRect = $suitcase_texture_ref
@onready var grid_container: GridContainer = $items_view/GridContainer
@onready var scroll_container: ScrollContainer = $items_view

# init variables here
var inventory = false

var all_items = {
  "red" : {
    "small_img" : preload("res://assets/16x16_test_images/red.png"), 
    "big_img" : "",
    "desc" : ""
  },
  "orange" : {
    "small_img" : preload("res://assets/16x16_test_images/orange.png"),
    "big_img" : "",
    "desc" : ""
  },    
  "yellow" : {
    "small_img" : preload("res://assets/16x16_test_images/yellow.png"),
    "big_img" : "",
    "desc" : ""
  },
  "green" : {
    "small_img" : preload("res://assets/16x16_test_images/green.png"),
    "big_img" : "",
    "desc" : ""
  },
  "light_blue" : {
    "small_img" : preload("res://assets/16x16_test_images/light_blue.png"),
    "big_img" : "",
    "desc" : ""
  },
  "dark_blue" : {
    "small_img" : preload("res://assets/16x16_test_images/dark_blue.png"),
    "big_img" : "",
    "desc" : ""
  },
  "purple" : {
    "small_img" : preload("res://assets/16x16_test_images/purple.png"),
    "big_img" : "",
    "desc" : ""
  },
  "magenta" : {
    "small_img" : preload("res://assets/16x16_test_images/magenta.png"),
    "big_img" : "",
    "desc" : ""
  },
}

var user_items = [
  "red",
  "orange",
  "yellow",
  "red",
  "light_blue",
  "red",
  "red",
  "red",
  "light_blue"
]

func add_children_to_grid_node() -> void:
  for item in user_items:
    if item not in all_items.keys():
      print("'%s' not found in all_items" % item)
    else:
      var image = TextureRect.new()
      image.texture = all_items[item]["small_img"]
      
      grid_container.add_child(image)

func clear_children_in_grid_node() -> void:
  for child in grid_container.get_children():
    child.queue_free()
    
func _ready() -> void:
  suitcase_ui.visible = false
  
  # make ugly scrollbar disappear
  scroll_container.get_v_scroll_bar().modulate.a = 0

func _process(_delta: float) -> void:
  if (inventory == false) and (Input.is_action_just_pressed("toggle_inventory")):
    add_children_to_grid_node()
    suitcase_ui.visible = true
    inventory = true
  elif (inventory == true) and (Input.is_action_just_pressed("toggle_inventory")):
    clear_children_in_grid_node()
    suitcase_ui.visible = false
    inventory = false

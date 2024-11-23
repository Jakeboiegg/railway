extends Node

# nodes here
@onready var suitcase_background: TextureRect = $suitcase_texture_ref/suitcase_background
@onready var items_view: ScrollContainer = $items_view
@onready var grid_container: GridContainer = $items_view/GridContainer
@onready var scroll_container: ScrollContainer = $items_view
@onready var highlight_node: TextureRect = $select_indicator

# init variables here
var inventory = false
var selected_index = 0

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
      var image = TextureButton.new()
      image.texture_normal = all_items[item]["small_img"]
      image.texture_hover = all_items[item]["small_img"]
      image.texture_pressed = all_items[item]["small_img"]
      image.texture_disabled = all_items[item]["small_img"]
      image.visible = true
      image.disabled = false
      grid_container.add_child(image)
  
  for i in range(grid_container.get_child_count()):
    var child = grid_container.get_child(i)
    child.pressed.connect(Callable(self, "_on_item_pressed").bind(i))
  
func clear_children_in_grid_node() -> void:
  for child in grid_container.get_children():
    child.queue_free()

func suitcase_ui_visibility(visibility : bool) -> void:
  suitcase_background.visible = visibility
  grid_container.visible = visibility
  highlight_node.visible = visibility

func _ready() -> void:
  suitcase_ui_visibility(false)

  # bring selector to first item
  highlight_node.global_position = Vector2(
    grid_container.global_position.x,
    grid_container.global_position.y,
  )
  
  # make ugly scrollbar disappear
  scroll_container.get_v_scroll_bar().modulate.a = 0

func _on_item_pressed(index):
    selected_index = index
    var selected_item = grid_container.get_child(index)
    var selected_item_x = selected_item.global_position.x
    var selected_item_y = selected_item.global_position.y

    highlight_node.global_position = Vector2(
      selected_item_x  ,
      selected_item_y  
    )
    

func _process(_delta: float) -> void:
  if (inventory == false) and (Input.is_action_just_pressed("toggle_inventory")):
    add_children_to_grid_node()
    suitcase_ui_visibility(true)
    inventory = true
  elif (inventory == true) and (Input.is_action_just_pressed("toggle_inventory")):
    clear_children_in_grid_node()
    suitcase_ui_visibility(false)
    inventory = false

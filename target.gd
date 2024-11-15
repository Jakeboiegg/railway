
extends Node
@onready var collision = get_node("Area2D/CollisionShape2D")
@onready var target = get_node(".")
var mouse_top = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(mouse_top)
	if mouse_top:
		target.play("blue")
	else:
		target.play("red")
	
func _on_area_2d_mouse_entered():
	print("entered!!")
	mouse_top = true
	
func _on_area_2d_mouse_exited():
	print("exited!!")
	mouse_top = false

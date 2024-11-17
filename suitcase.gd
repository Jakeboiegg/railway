extends Node

@onready var suitcase_ui: ReferenceRect = $suitcase_texture_ref
var inventory = false

func _ready() -> void:
	suitcase_ui.visible = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("toggle_inventory"):
		inventory = not inventory
		
	if inventory:
		suitcase_ui.visible = true
	else:
		suitcase_ui.visible = false

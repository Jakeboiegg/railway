extends CharacterBody2D


const SPEED = 50
const JUMP_VELOCITY = -400.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
  # Add the gravity.
  if not is_on_floor():
    velocity += get_gravity() * delta

  # Get the input direction and handle the movement/deceleration.
  # As good practice, you should replace UI actions with custom gameplay actions.
  var direction := Input.get_axis("move_left", "move_right")
  if direction:
    velocity.x = direction * SPEED
  else:
    velocity.x = move_toward(velocity.x, 0, SPEED)
  
  # animations
  if direction == 0:
    animated_sprite.play("idle")
  elif direction > 0:
    animated_sprite.flip_h = false
    animated_sprite.play("walk")
  else:
    animated_sprite.flip_h = true
    animated_sprite.play("walk")
  
  move_and_slide()

extends KinematicBody2D

export var id = 0
export var speed = 250

var velocity = Vector2()

func _input(event):
	if event.is_action_pressed('scroll_up'):
		$Camera2D.zoom = $Camera2D.zoom - Vector2(0.1, 0.1)
	if event.is_action_pressed('scroll_down'):
		$Camera2D.zoom = $Camera2D.zoom + Vector2(0.1, 0.1)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 100
		$AnimatedSprite.animation = "right"
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 100
		$AnimatedSprite.animation = "left"
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 100
		$AnimatedSprite.animation = "up"
	if Input.is_action_pressed('ui_down'):
		velocity.y += 100
		$AnimatedSprite.animation = "down"


func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

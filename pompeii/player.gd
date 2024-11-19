extends CharacterBody3D

@onready var head = $head
@onready var cam = $head/Camera3D
 
 
var accel = 6
var SPEED = 1.0
var JUMP_VELOCITY = 4.5
var crouched = false #определяет приседает игрок или нет
var input_dir = Vector3(0,0,0) #направление нажатия кнопок
var direction = Vector3() # направление игрок
var sens = 0.002
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
 
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
 
func _input(event: InputEvent): #повороты мышкой
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			head.rotate_y(-event.relative.x * sens)
			cam.rotate_x(-event.relative.y * sens)
			cam.rotation.x = clamp(cam.rotation.x,deg_to_rad(-89),deg_to_rad(89))
			
func _physics_process(delta):
	if Input.is_action_pressed("crouch"): #приседание
		crouched = true
		SPEED = 2.5
		$CollisionShape3D.scale.y = lerp($CollisionShape3D.scale.y,0.4,0.4)
		$CollisionShape3D.position.y = lerp($CollisionShape3D.position.y, 0.66,0.4)
		head.position.y = lerp(head.position.y, 1.0, 0.3)
	else:
		crouched = false
		SPEED = 5
		$CollisionShape3D.scale.y = lerp($CollisionShape3D.scale.y, 1.0 ,0.4)
		$CollisionShape3D.position.y = lerp($CollisionShape3D.position.y, 1.143,0.4)
		head.position.y = lerp(head.position.y, 1.85 , 0.3)
 
	if not is_on_floor(): #гравитация
		velocity.y -= gravity * delta
 
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and crouched == false: # прыжок
		velocity.y = JUMP_VELOCITY
		
	if is_on_floor() and Input.is_action_pressed("speed"):
		SPEED = 10
	else:
		SPEED = 5
	################################################хождение туда сюда
	input_dir = Input.get_vector("left", "right", "forward", "back")
	direction = ($head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
 
	velocity.x = lerp(velocity.x ,direction.x * SPEED, accel * delta)
	velocity.z = lerp(velocity.z ,direction.z * SPEED, accel * delta)
	move_and_slide()
	###################################################-- 

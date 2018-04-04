extends KinematicBody2D

const GRAVITY = 980
const SLIP = 2.25
const FLOORNORMAL = Vector2( 0, -1 )
const WALKSPEED = 250
const JUMPSTRENGTH = -500

var Velocity = Vector2()
var grounded = false
var landedTimer = 0

func _physics_process(delta):
	Velocity.y += GRAVITY * delta
	
	move_and_slide( Velocity, FLOORNORMAL )
	var targetSpeed = 0
	if Input.is_action_pressed("ui_left"):
		targetSpeed = -1
	elif Input.is_action_pressed("ui_right"):
		targetSpeed = 1
	if Input.is_action_just_pressed("ui_select"):
		if grounded:
			Velocity.y = JUMPSTRENGTH
			grounded = false
			
	targetSpeed *=  WALKSPEED
	
	if is_on_floor():
		grounded = true
	else:
		grounded = false
	
	if landedTimer > 0:
		landedTimer -= 1
	
	Velocity.x = lerp(Velocity.x, targetSpeed, 0.25)
			
	if abs(Velocity.x) < 1:
		Velocity.x = 0


func _ready():
	pass

func _process(delta):
	pass
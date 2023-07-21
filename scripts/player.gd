extends CharacterBody2D

const speed = 100
var current_dir = "none"

@onready var all_interactions = []
@onready var interactLabel = $"interactions/int_label"

func _ready():
	update_interactions()

func _physics_process(delta):
	player_movement(delta)
	
	if Input.is_action_just_pressed("interact"):
		execute_interaction()
	

func player_movement(delta):
	
	if Input.is_action_pressed("move_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("move_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("move_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("move_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = +speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	elif dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
			
	if dir == "up":
		anim.flip_h = false
		anim.play("back_idle")
	if dir == "down":
		anim.flip_h = false
		anim.play("front_idle")


func _on_area_2d_body_entered(body):
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	pass # Replace with function body.


func _on_int_area_area_entered(area):
	all_interactions.insert(0, area)
	update_interactions()


func _on_int_area_area_exited(area):
	all_interactions.erase(area)
	update_interactions()
	
func update_interactions():
	if all_interactions:
		interactLabel.text = all_interactions[0].interact_label
	else:
		interactLabel.text = ""
		
func execute_interaction():
	if all_interactions:
		var cur_inter = all_interactions[0]
		match cur_inter.interact_type:
			"print_text" : print(cur_inter.interact_value)
			

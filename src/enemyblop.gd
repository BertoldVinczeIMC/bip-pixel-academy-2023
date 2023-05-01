extends KinematicBody2D

signal touch

var speed = 50
var direction = Vector2.RIGHT
var velocity = Vector2.ZERO

var killSound = preload("res://SoundFX/kill_mobv2.wav")


func _ready():
	if direction == Vector2.RIGHT:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	var found_wall = is_on_wall()

	if found_wall:
		direction *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	velocity = speed * direction
	move_and_slide(velocity, Vector2.UP)




func _on_side_checker_body_entered(body):
	print("ouch")
	Global.lose_life()
	queue_free()

	
	


func _on_top_checker_body_entered(body):
	$AnimatedSprite.play("squashed")
	get_parent().get_parent().get_node("./SoundEffects").stream = killSound
	get_parent().get_parent().get_node("./SoundEffects").play()
	speed = 0
	set_collision_layer_bit(3,false)
	set_collision_mask_bit(2,false)
	$top_checker.set_collision_layer_bit(3,false)
	$top_checker.set_collision_mask_bit(2,false)
	$side_checker.set_collision_layer_bit(3,false)
	$side_checker.set_collision_mask_bit(2,false)
	queue_free()
	

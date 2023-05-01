extends Node2D

onready var MessageBox = get_node("FloatyText")
onready var MessageLabel = MessageBox.get_child(0)


var BackgroundMusic = preload("res://Music/01 Tea Is Served!.mp3")
var hintSound = preload("res://SoundFX/hint.wav")
var pipeSound = preload("res://SoundFX/pipe.wav")
var Section = 1

onready var music = ProjectSettings.get_setting("music")

func _ready():
	if music == false:
		$AudioStreamPlayer.volume_db = -80
		$SoundEffects.volume_db = -80
		
func _on_Area2D_body_entered(body):
	stop_music()
	queue_free()
	get_tree().change_scene("res://Levels/DemoLevel.tscn")
	Global.lose_life()

func _on_Player_collided(collision):
	if collision.collider is TileMap:
		var tile_pos = collision.collider.world_to_map($Player.position)
		tile_pos -= collision.normal # Colliding tile
		var tile_id = collision.collider.get_cellv(tile_pos)
		if tile_id >= 0:
			var tile_name = collision.collider.tile_set.tile_get_name(tile_id)
			print(tile_name)
			if tile_name == "NES - Super Mario Bros - Tileset.png 70":
				MessageLabel.text = "This is a custom message haha"
				MessageBox.position = Vector2(collision.position.x-50, collision.position.y+150)
				$SoundEffects.stream = hintSound
				$SoundEffects.play()

func _process(delta):
	# Check if the Escape key is pressed
	if Input.is_key_pressed(KEY_ESCAPE):
		# Get the scene tree
		var tree = get_tree()
		# Switch to a different screen
		tree.change_scene("res://MainMenu/MainMenu.tscn")
		queue_free()
	
	if !$AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.stream = BackgroundMusic
		$AudioStreamPlayer.play()

func stop_music():
	$AudioStreamPlayer.stream_paused = true
	$AudioStreamPlayer.stop()


func _on_Player_downPressed(collision):
	if collision.collider is TileMap:
		$SoundEffects.stream = pipeSound
		var tile_pos = collision.collider.world_to_map($Player.position)
		tile_pos -= collision.normal # Colliding tile
		var tile_id = collision.collider.get_cellv(tile_pos)
		if tile_id == -1:
			tile_pos.x = tile_pos.x - 1
			tile_id = collision.collider.get_cellv(tile_pos)
			$SoundEffects.play()
		if tile_id == 12: 
			Section = 1
			$SoundEffects.play()
			stop_music()
			queue_free()
			get_tree().change_scene("res://Levels/DemoLevel.tscn")
		if tile_id == 76:
			$SoundEffects.play()
			if Section == 2: 
				Section = 3
				$Player/Camera2D.limit_left = 2803
				$Player/Camera2D.limit_right = 3283
				$Player.position.x = 2860
				$Player.position.y = 260
				return
			if Section == 3:
				$Player/Camera2D.limit_left = 3459
				$Player/Camera2D.limit_right = 3939
				$Player.position.x = 3548
				$Player.position.y = 260
				return

func _on_Area2DQuiz_body_entered(body):
	Section = 2
	$Player/Camera2D.limit_left = 2115
	$Player/Camera2D.limit_right = 2595
	$Player.position.x = 2175
	$Player.position.y = 260


func _on_enemyblop_touch():
	print("signal")
	queue_free()
	get_tree().change_scene("res://Levels/DemoLevel.tscn")
	
	
func _on_enemyblop2_touch():
	queue_free()
	get_tree().change_scene("res://Levels/DemoLevel.tscn")

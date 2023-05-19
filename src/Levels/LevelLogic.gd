extends Node2D

var BackgroundMusic = preload("res://Music/super-mario-lofi.mp3")
var hintSound = preload("res://SoundFX/hint.wav")
var pipeSound = preload("res://SoundFX/pipe.wav")
var Section = 1

signal clue

func _ready():
	$AudioStreamPlayer.stream = BackgroundMusic
	$AudioStreamPlayer.play()
		
func _on_Area2D_body_entered(_body):
	$Player.position = $Player.groundPosition
	Global.lose_life()

func _on_Player_collided(collision):
	if collision.collider is TileMap:
		var tile_pos = collision.collider.world_to_map($Player.position)
		tile_pos -= collision.normal # Colliding tile
		var tile_id = collision.collider.get_cellv(tile_pos)
		if tile_id == -1:
			tile_pos.x -= 1
			tile_id = collision.collider.get_cellv(tile_pos)
			if tile_id == -1:
				tile_pos.x += 2
				tile_id = collision.collider.get_cellv(tile_pos)
		var tile_name = collision.collider.tile_set.tile_get_name(tile_id)
		if tile_name == "Question Mark Block":
			$SoundEffects.stream = hintSound
			$SoundEffects.play()
			yield($SoundEffects, "finished")
			emit_signal("clue")
			$TileMap.set_cell(tile_pos.x, tile_pos.y, -1)

func _on_Player_downPressed(collision):
	$SoundEffects.stream = pipeSound
	if collision.collider is TileMap:
		var tile_pos = collision.collider.world_to_map($Player.position)
		tile_pos -= collision.normal # Colliding tile
		var tile_id = collision.collider.get_cellv(tile_pos)
		if tile_id == -1:
			tile_pos.x = tile_pos.x - 1
			tile_id = collision.collider.get_cellv(tile_pos)
		var tile_name = collision.collider.tile_set.tile_get_name(tile_id)
		if tile_name == "Wrong Pipe":
			$SoundEffects.play()
			Global.lose_life()
		if tile_name == "Right Pipe":
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

func _on_Area2DQuiz_body_entered(_body):
	Section = 2
	$Player/Camera2D.limit_left = 2115
	$Player/Camera2D.limit_right = 2595
	$Player.position.x = 2175
	$Player.position.y = 260

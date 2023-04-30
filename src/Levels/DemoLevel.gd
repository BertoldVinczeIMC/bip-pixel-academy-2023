extends Node2D

var BackgroundMusic = preload("res://Music/01 Tea Is Served!.mp3")

func _on_Area2D_body_entered(body):
	stop_music()
	get_tree().change_scene("res://Levels/DemoLevel.tscn")


func _on_Player_collided(collision):
	# KinematicCollision2D object emmited by Player
	if collision.collider is TileMap:
		var tile_pos = collision.collider.world_to_map($Player.position)
		tile_pos -= collision.normal # Colliding tile
		var tile_id = collision.collider.get_cellv(tile_pos)
		if tile_id >= 0:
			var tile_name = collision.collider.tile_set.tile_get_name(tile_id)
			print(tile_name)

func _process(delta):
	if !$AudioStreamPlayer2D.is_playing():
		$AudioStreamPlayer2D.stream = BackgroundMusic
		$AudioStreamPlayer2D.play()

func stop_music():
	$AudioStreamPlayer2D.stream_paused = true
	$AudioStreamPlayer2D.stop()

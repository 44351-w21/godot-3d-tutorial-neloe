extends Node

export (PackedScene) var mob_scene

func _ready():
	randomize()


func _on_MobTimer_timeout():
	var enemy = mob_scene.instance()
	var mob_spawn_location = get_node("SpawnPath/PathFollow")
	mob_spawn_location.unit_offset = randf()
	
	var player_position = $Player.transform.origin
	add_child(enemy)
	enemy.initialize(mob_spawn_location.translation, player_position)

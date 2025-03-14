extends Node2D

@export var mob_scene: PackedScene
var score

func Game_over():
	$MobTimer.stop()

func new_game():
	$Player.start($StartPosition.position)
	$StartTimer.start()


func _on_start_timer_timeout():
	$MobTimer.start()

func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	var direction = mob_spawn_location.rotation + PI/2
	
	mob.position = mob_spawn_location.position;
	#var velocity = Vector2(randf_range(150.0,250.0),0.0)
	var velocity = Vector2.RIGHT.rotated(direction) * randf_range(150.0, 250.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
func _ready():
	new_game()

extends Node2D


@export var mainGameScene : PackedScene


func _on_play_button_up():
	get_tree().change_scene_to_file(mainGameScene.resource_path)


func _on_exit_button_up():
	get_tree().quit()

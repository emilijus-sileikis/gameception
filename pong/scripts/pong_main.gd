extends Node2D

var player_points = 0
var enemy_points = 0

@onready var enemy_paddle = $enemy_paddle
@onready var player_paddle = $pong_paddle
@onready var ball = $pong_ball as Ball
@onready var ui = $pong_ui


func _on_enemy_scored():
	enemy_points += 1
	ui.update_enemy_points(enemy_points)
	reset_game_state()


func _on_player_scored():
	player_points += 1
	ui.update_player_points(player_points)
	reset_game_state()
	
	
func reset_game_state():
	enemy_paddle.global_position.y = 317
	player_paddle.global_position.y = 317
	ball.global_position = Vector2(576, 318)
	ball.velocity = Vector2.ZERO
	enemy_paddle.linear_velocity = Vector2.ZERO
	player_paddle.linear_velocity = Vector2.ZERO
	ball.start_ball()

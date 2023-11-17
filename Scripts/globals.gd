extends Node

# Scenes
const SCENE_MAIN_MENU = "res://Scenes/main_menu.tscn"
const SCENE_GAME = "res://Scenes/game.tscn"

# Game status
var in_game = true

# Obstacle speed
var obstacle_speed = 2.0
var speed_acceleration = 0.1
var max_speed = 9.0

# Obstacle spawn rate
var min_obstacle_spawn_time = 1.0
var smallest_obstacle_spawn_time = 0.4
var spawn_time_acceleration = 0.02

# Other
var score = 0
var mouse_control = false


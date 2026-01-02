extends Node

var current_time := 0.0
var running := false

signal speedrun_start
signal speedrun_stop
signal speedrun_reset

func _process(delta: float) -> void:
	if running:
		current_time += delta

func start():
	running = true
	speedrun_start.emit()

func stop():
	running = false
	speedrun_stop.emit()

func reset():
	current_time = 0.0
	speedrun_reset.emit()

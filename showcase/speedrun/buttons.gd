extends Control


@onready var start_button = $Start
@onready var stop_button = $Stop
@onready var reset_button = $Reset

func _ready() -> void:
	start_button.pressed.connect(SpeedRun.start)
	stop_button.pressed.connect(SpeedRun.stop)
	reset_button.pressed.connect(SpeedRun.reset)

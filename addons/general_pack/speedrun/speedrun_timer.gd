extends Control

enum PRECISION_LEVEL {
	HOURS,
	MINUTES,
	SECONDS
}

@onready var text: RichTextLabel = $RichTextLabel
@export var precision_level := PRECISION_LEVEL.HOURS
@export var normal_color := Color.GREEN
@export var stopped_color := Color.SKY_BLUE
@export var autostart := false

var current_color := normal_color

func _ready() -> void:
	SpeedRun.speedrun_start.connect(set_color_normal)
	SpeedRun.speedrun_stop.connect(set_color_stopped)
	SpeedRun.speedrun_reset.connect(set_color_normal)
	if (autostart):
		SpeedRun.start()


func _process(delta: float) -> void:
	var time := SpeedRun.current_time

	var hh := time/3600
	var mm := (hh-floorf(hh))*60
	var ss := (mm-floorf(mm))*60
	var ms := (ss-floorf(ss))*100

	text.text = "[color=%s]"%current_color.to_html()
	if precision_level == PRECISION_LEVEL.HOURS:
		text.text += "%02d:%02d:%02d,%02d"%[int(hh), int(mm), int(ss), int(ms)]
	elif precision_level == PRECISION_LEVEL.MINUTES:
		text.text += "%02d:%02d,%02d"%[int(mm)+int(hh)*60, int(ss), int(ms)]
	elif precision_level == PRECISION_LEVEL.SECONDS:
		text.text += "%02d,%02d"%[int(ss)+int(mm)*60+int(hh)*3600, int(ms)]


func set_color_normal():
	current_color = normal_color

func set_color_stopped():
	current_color = stopped_color

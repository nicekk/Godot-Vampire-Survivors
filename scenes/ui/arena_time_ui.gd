extends CanvasLayer

@export var arena_time_manager: Node
@onready var label = %Label

func _process(delta: float) -> void:
	if arena_time_manager == null:
		return
	var time_elapsed = arena_time_manager.get_time_elapsed()
	label.text = format_seconds_to_string(time_elapsed)

func format_seconds_to_string(seconds: float):
	var minutes = floor(seconds / 60)
	var remaining_seconds = seconds - minutes * 60 
	return "%02d:%02d" % [int(minutes), int(floor(remaining_seconds))]

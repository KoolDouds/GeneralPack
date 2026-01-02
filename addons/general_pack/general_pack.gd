@tool
extends EditorPlugin



func _enable_plugin() -> void:
	EditorInterface.set_plugin_enabled("general_pack/speedrun", true)


func _disable_plugin() -> void:
	EditorInterface.set_plugin_enabled("general_pack/speedrun", false)


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass

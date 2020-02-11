extends Node

var current_scene = null;

# Source used:
# https://docs.godotengine.org/en/3.1/getting_started/step_by_step/singletons_autoload.html

func _ready():
	var root = get_tree().get_root();
	current_scene = root.get_child(root.get_child_count() - 1);


# This function will usually be called from a signal callback,
# or some other function in the current scene.
# Deleting the current scene at this point is
# a bad idea, because it may still be executing code.
# This will result in a crash or unexpected behavior.

# The solution is to defer the load to a later time, when
# we can be sure that no code from the current scene is running:
func goto_scene(path):
	call_deferred("_deferred_goto_scene", path);
	
# function to remove current scene
# load the next scene
# instance the new scene
# add it to the active scene as a child of the root
func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
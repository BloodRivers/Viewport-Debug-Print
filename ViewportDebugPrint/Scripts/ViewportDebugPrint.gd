extends Control

const PRINT_LOG_THEME: Theme = preload("uid://6k617i2lc3ef")
const PRINT_WARN_THEME: Theme = preload("uid://cam6ih3fgrn6b")
const PRINT_ERR_THEME: Theme = preload("uid://bplpwm4ic7ebj")

const DEBUG_PRINT_SCENE: PackedScene = preload("uid://b5nr1yt7kno0d")

@onready var print_container: VBoxContainer = %PrintContainer

var visible_timer: Timer = null


func _print_message(message: Variant, new_theme: Theme) -> void:
	var print_instance: RichTextLabel = DEBUG_PRINT_SCENE.instantiate() as RichTextLabel
	print_instance.text = str(message)
	print_instance.theme = new_theme
	print_container.add_child(print_instance)

	var tween: Tween = print_instance.create_tween().set_parallel(true)
	tween.tween_property(
		print_instance, "modulate:a", 1.0, 0.1
	).from(0.0)
	tween.tween_property(
		print_instance, "scale", Vector2.ONE, 0.2
	).from(Vector2.ZERO).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	
	visible_timer = print_instance.get_node("%VisibleTimer")
	visible_timer.timeout.connect(_on_visible_timer_timeout.bind(print_instance))
	visible_timer.start()


func log(message: Variant) -> void: _print_message(message, PRINT_LOG_THEME)
func warn(message: Variant) -> void: _print_message(message, PRINT_WARN_THEME)
func error(message: Variant) -> void: _print_message(message, PRINT_ERR_THEME)

func _on_visible_timer_timeout(print_instance: RichTextLabel) -> void:
	var tween: Tween = print_instance.create_tween()
	tween.tween_property(
		print_instance,
		"modulate:a",
		0.0,
		0.5,
	).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	await tween.finished
	print_instance.queue_free()

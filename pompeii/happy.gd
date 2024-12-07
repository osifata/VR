extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Создаём таймер
	var timer = Timer.new()
	timer.wait_time = 5.0  # Время ожидания в секундах
	timer.one_shot = true  # Таймер должен сработать один раз
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))  # Используем Callable
	add_child(timer)  # Добавляем таймер в сцену
	timer.start()  # Запускаем таймер

# Функция, которая вызывается после 5 секунд
func _on_timer_timeout() -> void:
	# Переход на другую сцену
	get_tree().call_deferred("change_scene_to_file", "res://menu.tscn")

extends Panel

var time: float = 180.0  # Начальное время в секундах (180 секунд = 3 минут)
var minutes: int = 0
var seconds: int = 0
var msec: int = 0
var timer_finished: bool = false  # Флаг для проверки, что таймер завершён

func _process(delta) -> void:
	if not timer_finished:  # Проверяем, что таймер ещё не завершён
		time -= delta  # Уменьшаем время на delta
		if time <= 0:  # Если таймер достигает нуля
			time = 0
			timer_finished = true  # Устанавливаем флаг завершения
			change_scene()  # Меняем сцену

		# Обновляем минуты, секунды и миллисекунды
		minutes = int(time) / 60  # Целое число минут
		seconds = int(time) % 60  # Остаток секунд
		msec = fmod(time, 1) * 1000  # Миллисекунды

		# Форматируем текст для отображения
		$min.text = "%02d:" % minutes  # Отображение минут
		$seconds.text = "%02d." % seconds  # Отображение секунд
		$milisec.text = "%03d" % msec  # Отображение миллисекунд

# Функция для смены сцены
func change_scene() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://bad_end.tscn")  # Укажите путь к новой сцене

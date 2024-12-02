extends Panel

var time: float = 300.0  # Начальное время в секундах
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
		
		# Обновляем секунды и миллисекунды
		msec = fmod(time, 1) * 1000  # Миллисекунды
		seconds = int(time)  # Целое число секунд

		# Форматируем текст для отображения
		$seconds.text = "%02d." % seconds
		$milisec.text = "%03d" % msec

# Функция для смены сцены
func change_scene() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://catscene.tscn")  # Укажите путь к новой сцене

#!/bin/bash

read -p "Введите запрос для пинга: " TARGET
failed_count=0

while true; do
	ping_result=$(ping -c 1 "$TARGET" | grep 'time=')

	if [[ -z "$ping_result" ]]; then
		((failed_count++))
		echo "Не удалось выполнить пинг ($failed_count/3)"
	else
		failed_count=0
		ping_time=$(echo "$ping_result" | grep -o 'time=[0-9.]*' | cut -d= -f2)
		echo "Пинг: ${ping_time} mc"
		if (( $(echo "$ping_time > 100" | bc -l) )); then
			echo "Высокое время отклика: ${ping_time} mc"
		fi
	fi

	if [[ $failed_count -ge 3 ]]; then
		echo "Пинг не удается 3 раза подряд."
		failed_count=0
	fi

	sleep 1
done

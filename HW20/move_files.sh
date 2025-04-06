#!/bin/bash
cd /opt/131224-wdm/koriahin-serhii/hw20_2
for file in *; do
	num=$(basename "$file")
		if [ $((num % 2)) -eq 0 ]; then
			mv "$file" /opt/131224-wdm/koriahin-serhii/hw20_3/
		else
			continue
		fi
done


#1/bin/bash

DATE=$(date +"%d.%m.%y")

	for i in {1..10}; do
		touch "${i}_${DATE}"
done


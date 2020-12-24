while true; do
	inotifywait zzz -e create |
		while read dir action file; do
			if [["$file"=~.?*]];
			then               
				notify-send new config created "$file"
			fi
		done
done

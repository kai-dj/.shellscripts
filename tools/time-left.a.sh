now=$(date +%s)
fa=$(date --date="$1" +%s )
togo=$((fa - now))
days=$((togo/86400))
hours=$(( (togo-days*86400)/3600 ))
mins=$(( (togo-days*86400 - hours*3600)/60 ))
secs=$(( togo - days*86400 - hours*3600 - mins*60 ))
printf '%dd:%02dh:%02dm:%02ds\n' $days $hours $mins $secs

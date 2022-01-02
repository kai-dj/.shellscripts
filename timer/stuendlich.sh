#!/usr/bin/env bash
#☁☂☔❄❅❆☃ ☀☁☂⚡⚐☼
# ️️ ☄★☆☉☘☙☸☽⚛⚡
#⌛8986 ⌚9113 ⎙
# weather-json="$(curl -Ls "api.openweathermap.org/data/2.5/weather?id=2911298&appid=e83057eb3335af689cfbfbdbc5470c12&units=metric")"
weather_json='{"coord":{"lon":10,"lat":53.55},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":17.56,"feels_like":17.8,"temp_min":16.54,"temp_max":19.31,"pressure":1010,"humidity":93},"visibility":10000,"wind":{"speed":2.06,"deg":220},"clouds":{"all":0},"dt":1627419544,"sys":{"type":1,"id":1263,"country":"DE","sunrise":1627356438,"sunset":1627413928},"timezone":7200,"id":2911298,"name":"Hamburg","cod":200}'
echo "۞"

# write xml to variable
# get fields from xml via xmllint | xargs for trimming
# weather description
w_txt=$(echo $weather_json | jq .weather[0].main | xargs);
w_id=$(echo $weather_json | jq .weather[0].id | xargs);
# temperature | remove spaces from text (&#176;C prepended by space)
w_tp=$(echo $weather_json | jq .main.temp)
LANG=C
w_tpc=$(printf "%.0f" $w_tp)
echo "$w_tpc""°C"
echo "$w_id"" id"

# set $w_sym according to $w_txt
if   [ "$w_txt" == "Sunny" ]; then w_sym="☼";
elif [ "$w_txt" == "Mostly Sunny" ]; then w_sym="☼";
elif [ "$w_txt" == "Showers" ]; then w_sym="☂";
elif [ "$w_txt" == "Clear" ]; then w_sym="☾";
elif [ "$w_txt" == "Thunderstorms" ]; then w_sym="⚡";
elif [ "$w_txt" == "Scattered Thunderstorms" ]; then w_sym="☔";
elif [ "$w_txt" == "Isolated Thundershovers" ]; then w_sym="☔";
elif [ "$w_txt" == "Cloudy" ]; then w_sym="☁";
elif [ "$w_txt" == "Mostly Cloudy" ]; then w_sym="☁";
elif [ "$w_txt" == "Partly Cloudy" ]; then w_sym="☼☁";
elif [ "$w_txt" == "Breezy" ]; then w_sym="⚐";
# if unknown text, set text instead of symbol
else w_sym=$w_txt;
fi
# output <symbol><space><temp-in-°C>
echo "$w_sym"" ""$w_tpc";
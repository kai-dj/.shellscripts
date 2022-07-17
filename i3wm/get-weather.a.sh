#!/usr/bin/env sh
#☁☂☔❄❅❆☃ ☀☁☂⚡⚐☼⛅☇☈☾⚡☔☔☁☁☼☁⚐☂☂☄☂⛆🌫

    #settings - adjust
    APIKEY="e83057eb3335af689cfbfbdbc5470c12"
    LAT="53.618814544576594"
    LON="10.131139271164836"
    #build query url
    QUERY="https://api.openweathermap.org/data/2.5/weather?lat="$LAT"&lon="$LON"&appid="$APIKEY"&units=metric"
    # write json to variable
    WEATHER_JSON=$(curl -Ls "$QUERY")
    if [ $? -eq 0 ]
    then
      echo "#ffffff" > ~/.shellscripts/i3wm/bg/assets/weathercolor
    else
      echo "#777777" > ~/.shellscripts/i3wm/bg/assets/weathercolor
      exit 0
    fi
    # get fields from xml via xmllint | xargs for trimming
    # weather description
    WEATHER_TEXT=$(jq -r '.weather | .[0] | .description' - <<<"$WEATHER_JSON" | xargs);
    WEATHER_ICON_CODE=$(jq -r '.weather | .[0] | .icon' - <<<"$WEATHER_JSON" | xargs);
    # temperature | remove spaces from text (&#176;C prepended by space) #WEATHER_TEMPERATURE=${WEATHER_TEMPERATURE//[[:blank:]]/};
    WEATHER_TEMPERATURE=$(jq -r '.main | .temp' - <<<"$WEATHER_JSON" | cut -d '.' -f 1 | xargs);

    # set $WEATHER_SYMBOL according to $WEATHER_TEXT
    if   [ "$WEATHER_ICON_CODE" == "01d" ]; then WEATHER_SYMBOL="☼"; elif [ "$WEATHER_ICON_CODE" == "01n" ]; then WEATHER_SYMBOL="☾";
    elif [ "$WEATHER_ICON_CODE" == "02d" ]; then WEATHER_SYMBOL="⛅";elif [ "$WEATHER_ICON_CODE" == "02n" ]; then WEATHER_SYMBOL="☁";
    elif [ "$WEATHER_ICON_CODE" == "03d" ]; then WEATHER_SYMBOL="☁"; elif [ "$WEATHER_ICON_CODE" == "03n" ]; then WEATHER_SYMBOL="☁";
    elif [ "$WEATHER_ICON_CODE" == "04d" ]; then WEATHER_SYMBOL="☁"; elif [ "$WEATHER_ICON_CODE" == "04n" ]; then WEATHER_SYMBOL="☁";
    elif [ "$WEATHER_ICON_CODE" == "09d" ]; then WEATHER_SYMBOL="☔"; elif [ "$WEATHER_ICON_CODE" == "09n" ]; then WEATHER_SYMBOL="☔";
    elif [ "$WEATHER_ICON_CODE" == "10d" ]; then WEATHER_SYMBOL="☂"; elif [ "$WEATHER_ICON_CODE" == "10n" ]; then WEATHER_SYMBOL="☂";
    elif [ "$WEATHER_ICON_CODE" == "11d" ]; then WEATHER_SYMBOL="⚡"; elif [ "$WEATHER_ICON_CODE" == "11n" ]; then WEATHER_SYMBOL="⚡";
    elif [ "$WEATHER_ICON_CODE" == "13d" ]; then WEATHER_SYMBOL="❄"; elif [ "$WEATHER_ICON_CODE" == "13n" ]; then WEATHER_SYMBOL="❄";
    elif [ "$WEATHER_ICON_CODE" == "50d" ]; then WEATHER_SYMBOL="⛆";elif [ "$WEATHER_ICON_CODE" == "50n" ]; then WEATHER_SYMBOL="⛆";
    # if unknown icon, set text instead of symbol
    else WEATHER_SYMBOL=$WEATHER_TEXT;
    fi
    # output <symbol><space><temp-in-°C>
    echo "$WEATHER_SYMBOL"" ""$WEATHER_TEMPERATURE""°C" > ~/.shellscripts/i3wm/bg/assets/weather;
    exit 0;
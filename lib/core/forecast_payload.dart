class WeatherForcastPayload {
  Location location;
  Current current;
  Forecast forecast;

  WeatherForcastPayload({
    required this.location,
    required this.current,
    required this.forecast,
  });

  WeatherForcastPayload.fromJson(Map<String, dynamic> json)
      : location = Location.fromJson(json['location']),
        current = Current.fromJson(json['current']),
        forecast = Forecast.fromJson(json['forecast']);

  Map<String, dynamic> toJson() => {
        'location': location.toJson(),
        'current': current.toJson(),
        'forecast': forecast.toJson(),
      };
}

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  int localtimeEpoch;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  Location.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        region = json['region'],
        country = json['country'],
        lat = json['lat'],
        lon = json['lon'],
        tzId = json['tz_id'],
        localtimeEpoch = json['localtime_epoch'],
        localtime = json['localtime'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'tz_id': tzId,
        'localtime_epoch': localtimeEpoch,
        'localtime': localtime,
      };
}

class Current {
  int lastUpdatedEpoch;
  String lastUpdated;
  double tempC;
  double tempF;
  int isDay;
  Condition condition;
  double windMph;
  double windKph;
  int windDegree;
  String windDir;
  double pressureMb;
  double pressureIn;
  double precipMm;
  double precipIn;
  int humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  double visKm;
  double visMiles;
  double uv;
  double gustMph;
  double gustKph;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  Current.fromJson(Map<String, dynamic> json)
      : lastUpdatedEpoch = json['last_updated_epoch'],
        lastUpdated = json['last_updated'],
        tempC = json['temp_c'],
        tempF = json['temp_f'],
        isDay = json['is_day'],
        condition = Condition.fromJson(json['condition']),
        windMph = json['wind_mph'],
        windKph = json['wind_kph'],
        windDegree = json['wind_degree'],
        windDir = json['wind_dir'],
        pressureMb = json['pressure_mb'],
        pressureIn = json['pressure_in'],
        precipMm = json['precip_mm'],
        precipIn = json['precip_in'],
        humidity = json['humidity'],
        cloud = json['cloud'],
        feelslikeC = json['feelslike_c'],
        feelslikeF = json['feelslike_f'],
        visKm = json['vis_km'],
        visMiles = json['vis_miles'],
        uv = json['uv'],
        gustMph = json['gust_mph'],
        gustKph = json['gust_kph'];

  Map<String, dynamic> toJson() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'last_updated': lastUpdated,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition.toJson(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'uv': uv,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
      };
}

class Condition {
  String text;
  String icon;
  int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  Condition.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        icon = json['icon'],
        code = json['code'];

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
        'code': code,
      };
}

class Forecast {
  List<Forecastday> forecastday;

  Forecast({required this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json)
      : forecastday = json['forecastday'].map<Forecastday>((element) => Forecastday.fromJson(element)).toList();

  Map<String, dynamic> toJson() => {
        'forecastday': forecastday.map((e) => e.toJson()).toList(),
      };
}

class Forecastday {
  String date;
  int dateEpoch;
  Day day;
  Astro astro;
  List<Hour> hour;

  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  Forecastday.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        dateEpoch = json['date_epoch'],
        day = Day.fromJson(json['day']),
        astro = Astro.fromJson(json['astro']),
        hour = json['hour'].map<Hour>((ele) => Hour.fromJson(ele)).toList();

  Map<String, dynamic> toJson() => {
        'date': date,
        'date_epoch': dateEpoch,
        'day': day.toJson(),
        'astro': astro.toJson(),
        'hour': hour.map((v) => v.toJson()).toList(),
      };
}

class Day {
  double maxtempC;
  double maxtempF;
  double mintempC;
  double mintempF;
  double avgtempC;
  double avgtempF;
  double maxwindMph;
  double maxwindKph;
  double totalprecipMm;
  double totalprecipIn;
  double avgvisKm;
  double avgvisMiles;
  double avghumidity;
  int dailyWillItRain;
  int dailyChanceOfRain;
  int dailyWillItSnow;
  int dailyChanceOfSnow;
  Condition condition;
  double uv;

  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  Day.fromJson(Map<String, dynamic> json)
      : maxtempC = json['maxtemp_c'],
        maxtempF = json['maxtemp_f'],
        mintempC = json['mintemp_c'],
        mintempF = json['mintemp_f'],
        avgtempC = json['avgtemp_c'],
        avgtempF = json['avgtemp_f'],
        maxwindMph = json['maxwind_mph'],
        maxwindKph = json['maxwind_kph'],
        totalprecipMm = json['totalprecip_mm'],
        totalprecipIn = json['totalprecip_in'],
        avgvisKm = json['avgvis_km'],
        avgvisMiles = json['avgvis_miles'],
        avghumidity = json['avghumidity'],
        dailyWillItRain = json['daily_will_it_rain'],
        dailyChanceOfRain = json['daily_chance_of_rain'],
        dailyWillItSnow = json['daily_will_it_snow'],
        dailyChanceOfSnow = json['daily_chance_of_snow'],
        condition = Condition.fromJson(json['condition']),
        uv = json['uv'];

  Map<String, dynamic> toJson() => {
        'maxtemp_c': maxtempC,
        'maxtemp_f': maxtempF,
        'mintemp_c': mintempC,
        'mintemp_f': mintempF,
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'maxwind_mph': maxwindMph,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalprecip_in': totalprecipIn,
        'avgvis_km': avgvisKm,
        'avgvis_miles': avgvisMiles,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition.toJson(),
        'uv': uv,
      };
}

class Astro {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonPhase;
  String moonIllumination;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  Astro.fromJson(Map<String, dynamic> json)
      : sunrise = json['sunrise'],
        sunset = json['sunset'],
        moonrise = json['moonrise'],
        moonset = json['moonset'],
        moonPhase = json['moon_phase'],
        moonIllumination = json['moon_illumination'];

  Map<String, dynamic> toJson() => {
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'moon_illumination': moonIllumination,
      };
}

class Hour {
  int timeEpoch;
  String time;
  double tempC;
  double tempF;
  int isDay;
  Condition condition;
  double windMph;
  double windKph;
  int windDegree;
  String windDir;
  double pressureMb;
  double pressureIn;
  double precipMm;
  double precipIn;
  int humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  double windchillC;
  double windchillF;
  double heatindexC;
  double heatindexF;
  double dewpointC;
  double dewpointF;
  int willItRain;
  int chanceOfRain;
  int willItSnow;
  int chanceOfSnow;
  double visKm;
  double visMiles;
  double gustMph;
  double gustKph;
  double uv;

  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  Hour.fromJson(Map<String, dynamic> json)
      : timeEpoch = json['time_epoch'],
        time = json['time'],
        tempC = json['temp_c'],
        tempF = json['temp_f'],
        isDay = json['is_day'],
        condition = Condition.fromJson(json['condition']),
        windMph = json['wind_mph'],
        windKph = json['wind_kph'],
        windDegree = json['wind_degree'],
        windDir = json['wind_dir'],
        pressureMb = json['pressure_mb'],
        pressureIn = json['pressure_in'],
        precipMm = json['precip_mm'],
        precipIn = json['precip_in'],
        humidity = json['humidity'],
        cloud = json['cloud'],
        feelslikeC = json['feelslike_c'],
        feelslikeF = json['feelslike_f'],
        windchillC = json['windchill_c'],
        windchillF = json['windchill_f'],
        heatindexC = json['heatindex_c'],
        heatindexF = json['heatindex_f'],
        dewpointC = json['dewpoint_c'],
        dewpointF = json['dewpoint_f'],
        willItRain = json['will_it_rain'],
        chanceOfRain = json['chance_of_rain'],
        willItSnow = json['will_it_snow'],
        chanceOfSnow = json['chance_of_snow'],
        visKm = json['vis_km'],
        visMiles = json['vis_miles'],
        gustMph = json['gust_mph'],
        gustKph = json['gust_kph'],
        uv = json['uv'];

  Map<String, dynamic> toJson() => {
        'time_epoch': timeEpoch,
        'time': time,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition.toJson(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'windchill_c': windchillC,
        'windchill_f': windchillF,
        'heatindex_c': heatindexC,
        'heatindex_f': heatindexF,
        'dewpoint_c': dewpointC,
        'dewpoint_f': dewpointF,
        'will_it_rain': willItRain,
        'chance_of_rain': chanceOfRain,
        'will_it_snow': willItSnow,
        'chance_of_snow': chanceOfSnow,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
        'uv': uv,
      };
}

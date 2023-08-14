class WeatherData {

  late final Coord coord;
  late final List<Weather> weather;
  late final String base;
  late final Main main;
  late final int visibility;
  late final Wind wind;
  late final Clouds clouds;
  late final int dt;
  late final Sys sys;
  late final int timezone;
  late final int id;
  late final String name;
  late final int cod;

  WeatherData.fromJson(Map<String, dynamic> json){
    coord = Coord.fromJson(json['coord']);
    weather = List.from(json['weather']).map((e)=>Weather.fromJson(e)).toList();
    base = json['base'];
    main = Main.fromJson(json['main']);
    visibility = json['visibility'];
    wind = Wind.fromJson(json['wind']);
    clouds = Clouds.fromJson(json['clouds']);
    dt = json['dt'];
    sys = Sys.fromJson(json['sys']);
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
}

class Coord {
  late final double lon;
  late final double lat;

  Coord.fromJson(Map<String, dynamic> json){
    lon = json['lon'];
    lat = json['lat'];
  }
}

class Weather {
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json){
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Main {
  late final double temp;
  late final double feelsLike;
  late final double tempMin;
  late final double tempMax;
  late final int pressure;
  late final int humidity;

  Main.fromJson(Map<String, dynamic> json){
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class Wind {
  late final double speed;
  late final double deg;

  Wind.fromJson(Map<String, dynamic> json){
    speed = double.parse(json['speed'].toString());
    deg = double.parse(json['deg'].toString());
  }
}

class Clouds {
  late final int all;

  Clouds.fromJson(Map<String, dynamic> json){
    all = json['all'];
  }
}

class Sys {
  late final int type;
  late final int id;
  late final String country;
  late final int sunrise;
  late final int sunset;

  Sys.fromJson(Map<String, dynamic> json){
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}
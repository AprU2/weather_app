class Weather {
  String? icon;
  double? temp;
  String? cityName;
  int? humidity;
  double? wind;

  Weather({this.icon, this.temp, this.cityName, this.humidity, this.wind});

  Weather.fromJson(Map<String, dynamic> json) {
    final weatherIcon = json['weather'][0];
    icon = weatherIcon['icon'];
    cityName = json['name'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    humidity = json['main']['humidity'];
  }
}

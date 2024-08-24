class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double averageTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherStatus;

  const WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.averageTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStatus,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      averageTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherStatus: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}

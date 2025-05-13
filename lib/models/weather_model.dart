class Weather {
  final DateTime date;
  final double temp;
  final double min;
  final double max;
  final String main;         // e.g., "Rain"
  final String description;  // e.g., "moderate rain"
  final String icon;

  Weather({
    required this.date,
    required this.temp,
    required this.min,
    required this.max,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      date: DateTime.parse(json['dt_txt']),
      temp: json['main']['temp'].toDouble(),
      min: json['main']['temp_min'].toDouble(),
      max: json['main']['temp_max'].toDouble(),
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}

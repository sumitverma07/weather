class Weather {
  final String description;
  final double temperature;

  Weather({required this.description, required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        description: json['city'],
        temperature: json['population'] // Convert from Kelvin to Celsius
        );
  }
}

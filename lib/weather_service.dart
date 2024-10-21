import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model.dart';

class WeatherService {
  final String apiKey = 'cfc45579ad27d1fba02a78688ca9c39c';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  List<Weather> weathers = [];

  Future<Weather> getWeather(String cityName) async {
    final response =
        await http.get(Uri.parse('$baseUrl?q=$cityName&appid=$apiKey'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)['data'] as List;
      json.forEach((data) {
        weathers.add(Weather.fromJson(data));
      });
      return weathers.firstWhere((data) => data.description.contains('Kanpur'));
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}

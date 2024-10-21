import 'package:weather_app/model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weather;

  WeatherLoadedState(this.weather);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}

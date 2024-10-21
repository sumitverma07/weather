import 'package:bloc/bloc.dart';
import 'package:weather_app/cubit/weather_state.dart';

import '../weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  void fetchWeather(String cityName) async {
    try {
      emit(WeatherLoadingState());
      final weather = await weatherService.getWeather(cityName);
      emit(WeatherLoadedState(weather));
    } catch (e) {
      emit(WeatherError("Could not fetch weather data"));
    }
  }
}

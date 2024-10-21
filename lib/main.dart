import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/city_cubit.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/pages/search_screen.dart';
import 'package:weather_app/weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<CityCubit>(create: (context) => CityCubit()),
      BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(WeatherService())),
    ], child: MaterialApp(home: SearchScreen()));
  }
}

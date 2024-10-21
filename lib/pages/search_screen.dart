import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/city_cubit.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cityCubit = context.read<CityCubit>();
    final weatherCubit = context.read<WeatherCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Search Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter City Name',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                cityCubit.fetchCitySuggestions(query);
              },
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                weatherCubit.fetchWeather(_controller.text);
              },
              child: Text("Search",
                  style: TextStyle(fontSize: 20, color: Colors.green)),
            ),
            BlocBuilder<CityCubit, List<String>>(
              builder: (context, citySuggestions) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: citySuggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(citySuggestions[index]),
                        onTap: () {
                          _controller.text = citySuggestions[index];
                        },
                      );
                    },
                  ),
                );
              },
            ),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoadingState) {
                  return CircularProgressIndicator();
                } else if (state is WeatherLoadedState) {
                  return Column(
                    children: [
                      Text('Description: ${state.weather.description}'),
                      Text(
                          'Temperature: ${state.weather.temperature.toStringAsFixed(2)} °C'),
                    ],
                  );
                } else if (state is WeatherError) {
                  return Text(state.message);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

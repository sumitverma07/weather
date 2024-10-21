import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CityCubit extends Cubit<List<String>> {
  CityCubit() : super([]);

  void fetchCitySuggestions(String query) async {
    if (query.isEmpty) {
      emit([]);
      return;
    }

    final response = await http.get(
      Uri.parse(
          'https://wft-geo-db.p.rapidapi.com/v1/geo/cities?namePrefix=$query'),
      headers: {
        'x-rapidapi-key': 'b3a8efc234mshfa17c179c5a4f0ap1d9febjsned7559305a83',
        'x-rapidapi-host': 'wft-geo-db.p.rapidapi.com',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<String> cities = (data['data'] as List<dynamic>)
          .map((city) => city['city'] as String)
          .toList();
      emit(cities);
    } else {
      emit([]);
    }
  }
}

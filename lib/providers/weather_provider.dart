import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  final String apiKey = '36c276e73aede5c4fa5dadaf4d9fab77'; // api key from openweathermap
  final double lat = 1.332359766395726;
  final double lon = 103.89207915696818;

  List<Weather> _weatherList = [];
  List<Weather> get weatherList => _weatherList;

  List<Weather> _filteredList = [];
  List<Weather> get filteredList => _filteredList;

  bool isLoading = true;

  WeatherProvider() {
    fetchWeather();
  }
//api fetch
  Future<void> fetchWeather() async {
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&units=metric&appid=$apiKey';

    try {
      final res = await http.get(Uri.parse(url));
      final data = json.decode(res.body);

      final List list = data['list'];
      _weatherList = list.map((item) => Weather.fromJson(item)).toList();

      // Filter one forecast per day (around 12:00–15:00)
      _filteredList = _weatherList.where((e) => e.date.hour == 12).toList();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print("Error: $e");
    }
  }
  void filter(String query) {
    if (query.isEmpty) {
      _filteredList = _weatherList.where((e) => e.date.hour == 12).toList();
    } else {
      _filteredList = _weatherList
          .where((w) =>
          w.date.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}

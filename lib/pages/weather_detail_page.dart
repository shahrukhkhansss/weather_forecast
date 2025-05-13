import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_model.dart';

class WeatherDetailPage extends StatelessWidget {
  final Weather weather;

  const WeatherDetailPage({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001F3F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Weather Details"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('EEE, MMM d, yyyy').format(weather.date),
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 5),
              Text(
                DateFormat.jm().format(weather.date),
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 30),
              Text(
                "${weather.temp.toStringAsFixed(1)} °C",
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Image.network(
                "https://openweathermap.org/img/wn/${weather.icon}@2x.png",
                scale: 1.2,
              ),
              const SizedBox(height: 10),
              Text(
                "${weather.main} (${weather.description})",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("Temp (min)", style: TextStyle(fontSize: 16)),
                  Text("Temp (max)", style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${weather.min.toStringAsFixed(1)}°C",
                      style: const TextStyle(fontSize: 18)),
                  Text("${weather.max.toStringAsFixed(1)}°C",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

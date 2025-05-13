import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_model.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather;
  final String label;
  final VoidCallback onTap;

  const WeatherTile({
    super.key,
    required this.weather,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: const Color(0xFF003366),
      child: ListTile(
        onTap: onTap,
        leading: Image.network(
          "https://openweathermap.org/img/wn/${weather.icon}@2x.png",
          errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.cloud, color: Colors.white),
        ),
        title: Text(label),
        subtitle: Text(
          "${weather.main} (${weather.description})\n"
              "${DateFormat.jm().format(weather.date)} - ${DateFormat.jm().format(weather.date)}\n"
              "Min ${weather.min.toStringAsFixed(1)}°C • Max ${weather.max.toStringAsFixed(1)}°C",
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        textColor: Colors.white,
      ),
    );
  }
}

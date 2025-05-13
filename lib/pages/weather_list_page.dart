import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_tile.dart';
import 'weather_detail_page.dart';

class WeatherListPage extends StatelessWidget {
  const WeatherListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Report'),
        backgroundColor: const Color(0xFF003366),
      ),
      backgroundColor: const Color(0xFF001f3f),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              // text field to search
              child: TextField(
                onChanged: provider.filter,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 14),
                  hintText: 'Search date...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // its show the weather report in list
          Expanded(
            child: ListView.builder(
              itemCount: provider.filteredList.length,
              itemBuilder: (context, index) {
                final item = provider.filteredList[index];
                final isToday = DateTime.now().day == item.date.day &&
                    DateTime.now().month == item.date.month &&
                    DateTime.now().year == item.date.year;

                return WeatherTile(
                  weather: item,
                  label: isToday
                      ? 'Today'
                      : DateFormat('EEEE, MMM d, yyyy').format(item.date),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            WeatherDetailPage(weather: item),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

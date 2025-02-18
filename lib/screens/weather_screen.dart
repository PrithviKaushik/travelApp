import 'package:flutter/material.dart';
import 'package:travel_app/models/models.dart';

class WeatherForecastScreen extends StatelessWidget {
  final String cityName;
  final List<Forecast> forecast;

  const WeatherForecastScreen({
    super.key,
    required this.cityName,
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$cityName Forecast'),
      ),
      body: forecast.isEmpty
          ? Center(child: Text('No forecast data available'))
          : ListView.builder(
              itemCount: forecast.length,
              itemBuilder: (context, index) {
                final item = forecast[index];
                return ListTile(
                  leading: Image.network(
                      'http://openweathermap.org/img/wn/${item.icon}@2x.png'), // Displaying the weather icon for forecast
                  title: Text(item.description),
                  subtitle: Text(
                      '${item.temperature.toStringAsFixed(1)}°C, ${item.dateTime.toLocal()}'),
                );
              },
            ),
    );
  }
}

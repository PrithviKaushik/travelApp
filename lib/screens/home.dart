import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/weather_provider.dart';
import 'package:travel_app/shared/bottom_nav.dart';
import 'package:travel_app/providers/providers.dart';
import 'package:travel_app/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch weather data for current location on startup once
    Provider.of<WeatherProvider>(context, listen: false).fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final weatherProvider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TravelFree'),
      ),
      body: Column(
        children: [
          weatherProvider.isLoading
              ? CircularProgressIndicator() // Show loading indicator
              : weatherProvider.errorMessage != null
                  ? Text(weatherProvider.errorMessage!) // Show error message
                  : weatherProvider.currentWeather != null
                      ? WeatherCard(
                          cityName: weatherProvider.currentWeather!.cityName,
                          weatherDescription:
                              weatherProvider.currentWeather!.description,
                          iconUrl: weatherProvider.currentWeather!.icon,
                          temperature: weatherProvider.currentWeather!.temp,
                          forecast: weatherProvider.forecast!,
                        )
                      : Text("No weather data available"),
          Center(
            child: Text('TravelFree'),
          ),
          ElevatedButton(
              onPressed: () async {
                await authProvider.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Sign Out')),
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

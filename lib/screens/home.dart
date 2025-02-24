import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/weather_provider.dart';
import 'package:travel_app/shared/bottom_nav.dart';
import 'package:travel_app/providers/providers.dart';
import 'package:travel_app/widgets/destinations.dart';
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
    // Fetch weather data and tourist destinations for current location on startup once
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    final placeProvider = Provider.of<PlaceProvider>(context, listen: false);

    weatherProvider.fetchWeather();
    placeProvider.fetchTouristDestinations();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('TravelFree'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Consumer<WeatherProvider>(
            builder: (context, weatherProvider, child) {
              return weatherProvider.isLoading
                  ? CircularProgressIndicator() // Show loading indicator
                  : weatherProvider.errorMessage != null
                      ? Text(
                          weatherProvider.errorMessage!) // Show error message
                      : weatherProvider.currentWeather != null
                          ? WeatherCard(
                              cityName:
                                  weatherProvider.currentWeather!.cityName,
                              weatherDescription:
                                  weatherProvider.currentWeather!.description,
                              iconUrl: weatherProvider.currentWeather!.icon,
                              temperature: weatherProvider.currentWeather!.temp,
                              forecast: weatherProvider.forecast!,
                            )
                          : Text("No weather data available");
            },
          ),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Popular Tourist Destinations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Consumer<PlaceProvider>(
            builder: (context, placeProvider, child) {
              return placeProvider.isLoading
                  ? CircularProgressIndicator() // Show loading indicator
                  : placeProvider.errorMessage != null
                      ? Text(placeProvider.errorMessage!) // Show error message
                      : placeProvider.places != null
                          ? Expanded(
                              child: DestinationsList(
                                places: placeProvider.places ?? [],
                                apiKey: placeProvider.placeApiKey,
                              ),
                            )
                          : const Center(
                              child: Text('No destinations available'),
                            );
            },
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

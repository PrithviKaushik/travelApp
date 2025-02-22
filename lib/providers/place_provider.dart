import 'package:flutter/material.dart';
import 'package:travel_app/models/models.dart';
import 'package:travel_app/services/services.dart';

class PlaceProvider extends ChangeNotifier {
  final PlaceService placeService;
  final WeatherService weatherService;

  List<Place>? places;
  bool isLoading = false;
  String? errorMessage;

  PlaceProvider({
    required this.placeService,
    required this.weatherService,
  });

  // getter to get api key from placeService
  String get placeApiKey => placeService.apiKey;

  // Method to fetch tourist destinations
  Future<void> fetchTouristDestinations() async {
    isLoading = true;
    notifyListeners();

    try {
      String city = await weatherService.getCityFromCurrentLocation();
      places = await placeService.getTouristDestinations(city);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}

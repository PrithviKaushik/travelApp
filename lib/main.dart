import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel_app/providers/auth_provider.dart';
import 'package:travel_app/providers/providers.dart';
import 'package:travel_app/providers/weather_provider.dart';
import 'package:travel_app/routes.dart';
import 'package:travel_app/services/services.dart';
import 'package:travel_app/theme.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(
        create: (_) => WeatherProvider(
            weatherService:
                WeatherService(apiKey: '16d08a2df3580415f76422da7be567a8')),
      ),
      ChangeNotifierProvider(
        create: (_) => PlaceProvider(
            placeService:
                PlaceService(apiKey: 'AIzaSyAk-9uSpw7SNcezKeTlFo29GVxkrLPl0zU'),
            weatherService:
                WeatherService(apiKey: '16d08a2df3580415f76422da7be567a8')),
      ),
    ],
    child: const TravelApp(),
  ));
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelFree',
      theme: appTheme,
      routes: appRoutes,
    );
  }
}

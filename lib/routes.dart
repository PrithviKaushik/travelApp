import 'package:travel_app/screens/map_screen.dart';
import 'package:travel_app/screens/screens.dart';
import 'package:travel_app/screens/sign_up_screen.dart';

var appRoutes = {
  '/': (context) => SignUpScreen(),
  '/signin': (context) => SignInScreen(),
  '/home': (context) => HomeScreen(),
  '/guide': (context) => GuideScreen(),
  '/emergency': (context) => EmergencyScreen(),
};

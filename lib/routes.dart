import 'package:travel_app/screens/screens.dart';

var appRoutes = {
  '/': (context) => SignUpScreen(),
  '/signin': (context) => SignInScreen(),
  '/home': (context) => HomeScreen(),
  '/photos': (context) => PhotoListScreen(),
  '/guide': (context) => GuideScreen(),
};

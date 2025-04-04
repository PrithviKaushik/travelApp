import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/screens.dart';
import 'package:travel_app/providers/auth_provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    // If the user is null, show the sign-in screen; otherwise, show HomeScreen.
    // Optionally, you can add a loading indicator if you want to handle a transient loading state.
    if (authProvider.user == null) {
      return SignInScreen();
    } else {
      return HomeScreen();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/shared/bottom_nav.dart';
import 'package:travel_app/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TravelFree'),
      ),
      body: Column(
        children: [
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

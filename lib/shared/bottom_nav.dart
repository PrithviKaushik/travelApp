import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 20,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.handshake,
            size: 20,
          ),
          label: 'Guide',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emergency, size: 20),
          label: 'Emergency',
        ),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/guide');
            break;
          case 2:
            Navigator.pushNamed(context, '/emergency');
            break;
        }
      },
    );
  }
}

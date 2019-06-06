import 'package:flutter/material.dart';

import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Home screen'),
      appBar: AppBar(
        title: Text("Simple time table"),
      ),
      drawer: MyDrawer(
        company: 'Coreline',
        image: 'assets/icon.png',
        items: [
          DrawerItem(icon: Icons.face, name: 'Profile'),
          DrawerItem(icon: Icons.date_range, name: 'Hours'),
          DrawerItem(icon: Icons.dashboard, name: 'Dashboard'),
          DrawerItem(icon: Icons.description, name: 'Projects'),
        ],
      ),
    );
  }
}
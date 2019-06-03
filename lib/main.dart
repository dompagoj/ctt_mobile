import 'package:ctt_mobile/services/user_service.dart';
import 'package:ctt_mobile/theme.dart';
import 'package:ctt_mobile/widgets/MainLayout.dart';
import 'package:ctt_mobile/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    test();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: DARK_BLUE,
          appBarTheme: AppBarTheme(
            color: DARK_BLUE,
          )),
      home: HomeScreen(),
    );
  }
}

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Hello!'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(),
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

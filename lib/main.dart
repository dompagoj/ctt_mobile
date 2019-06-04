import 'package:ctt_mobile/routes.dart';
import 'package:ctt_mobile/widgets/SignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ctt_mobile/theme.dart';
import 'package:ctt_mobile/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getToken(),
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primaryColor: DARK_BLUE,
                appBarTheme: AppBarTheme(
                  color: DARK_BLUE,
                )),
            home: SignIn(),
          );
        });
  }

  getToken() async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getString('token');
  }
}

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

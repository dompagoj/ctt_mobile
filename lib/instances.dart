import 'package:ctt_mobile/routes.dart';
import 'package:ctt_mobile/widgets/drawer.dart';
import 'package:flutter/material.dart';

final myDrawer = MyDrawer(
  company: 'Coreline',
  image: 'assets/icon.png',
  items: [
    DrawerItem(icon: Icons.face, name: 'Profile', action: Router.goToProfile),
    DrawerItem(icon: Icons.date_range, name: 'Hours', action: Router.goToHours),
    DrawerItem(icon: Icons.dashboard, name: 'Dashboard'),
    DrawerItem(icon: Icons.description, name: 'Projects'),
    DrawerItem(icon: Icons.exit_to_app, name: 'Logout', action: Router.logout),
  ],
);

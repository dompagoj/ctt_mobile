import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme.dart';

class DrawerItem {
  final String name;
  final IconData icon;

  DrawerItem({
    this.name,
    this.icon,
  });
}

class MyDrawer extends StatelessWidget {
  final List<DrawerItem> items;
  final String company;
  final String image;

  MyDrawer({
    this.company,
    this.image,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: DARK_BLUE,
        child: ListView(
          children: <Widget>[
            getHeader(),
            ...getItems(),
          ],
        ),
      ),
    );
  }

  void onTap() {
    debugPrint('Tapped!');
  }

  DrawerHeader getHeader() => DrawerHeader(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Container(
          child: Column(
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                child: Image.asset(image, width: 75, height: 75),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                company,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
      ));

  Iterable<Material> getItems() => items.map((item) => Material(
        color: DARK_BLUE,
        child: InkWell(
          splashColor: Colors.white12,
          borderRadius: BorderRadius.circular(5),
          highlightColor: Colors.red,
          onTap: onTap,
          child: Container(
            height: 55,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 8),
              child: Row(
                children: <Widget>[
                  Icon(item.icon, size: 30, color: GREY),
                  Padding(padding: EdgeInsets.only(right: 8.0)),
                  greyText(item.name, 18)
                ],
              ),
            ),
          ),
        ),
      ));
}
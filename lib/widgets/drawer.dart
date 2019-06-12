import 'dart:math';

import 'package:ctt_mobile/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme.dart';

class DrawerItem {
  final String name;
  final IconData icon;
  final void Function(BuildContext context) action;

  DrawerItem({
    this.name,
    this.icon,
    this.action,
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
            ...getItems(context),
          ],
        ),
      ),
    );
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

  Iterable<Material> getItems(BuildContext context) => items.map((item) => Material(
        color: DARK_BLUE,
        child: InkWell(
          splashColor: Colors.white12,
          borderRadius: BorderRadius.circular(5),
          highlightColor: Colors.red,
          onTap: () => item.action != null ? item.action(context) : {},
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

import 'package:ctt_mobile/instances.dart';
import 'package:ctt_mobile/main.dart';
import 'package:ctt_mobile/services/auth_service.dart';
import 'package:ctt_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class Profile extends StatelessWidget {
  final authService = getIt.get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK_BLUE,
      drawer: myDrawer,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 275,
              child: Stack(children: <Widget>[
                Center(child: CircularProgressIndicator()),
                FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: authService.user.avatar)
              ],)
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {},
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 35, right: 35),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: whiteText('Edit profile'),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                getItem('Username', authService.user.username),
                getItem('Email', authService.user.email),
                getItem('Firstname', authService.user.firstName),
                getItem('Lastname', authService.user.lastName),
              ],
            )
          ],
        ),
      ),
    );
  }

  getItem(String label, String value) {
    return Container(
      height: 75,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.white30,
                      width: 1,
                    )
                )
            ),
            child: Column(
              children: <Widget>[
               Container(
                 width: 300,
                 child:  Text(
                   label,
                   style: TextStyle(color: Colors.green, fontSize: 16.0),
                 ),
               ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 300,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

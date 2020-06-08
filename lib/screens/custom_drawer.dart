import 'package:flutter/material.dart';
import 'package:tur/screens/about.dart';
import 'package:tur/screens/contact.dart';
import 'package:tur/screens/services.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xff396AFC),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.asset('assets/logo.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.help,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.question_answer,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Contact',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Contact()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Services',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Services()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.web,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Website',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () async {
                const url = 'https://myturkeyproperty.com';

                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

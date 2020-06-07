import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tur/screens/about.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String username;
  String userphone;
  String useremail;
  String usermsg;
  bool isMessageSent = false;
  Future sendMsgFunc() async {
    Response response = await post(
        'https://www.myturkeyproperty.com/wp-json/contact-form-7/v1/contact-forms/516/feedback',
        body: {
          'testrestname': username,
          'testrestphone': userphone,
          'testrestemail': useremail,
          'testrestmsg': usermsg,
        });
    setState(() {
      isMessageSent = json.decode(response.body)['status'] == 'mail_sent';
    });
    return json.decode(response.body)['status'] == 'mail_sent';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 0, // THIS WAY IT WILL NOT OPEN
      key: _drawerKey, // assign key to Scaffold

      drawer: Drawer(
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
                  // Update the state of the app.
                  // ...
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
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20.0,
                    color: const Color(0xff396AFC),
                  ),
                  label: Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: const Color(0xff396AFC),
                    ),
                  ),
                ),
                Text(
                  'Contact',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: const Color(0xff396AFC),
                  ),
                ),
                IconButton(
                  onPressed: () => _drawerKey.currentState.openDrawer(),
                  icon: Icon(
                    Icons.menu,
                    size: 30.0,
                    color: const Color(0xff396AFC),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      username = text;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(
                      Icons.phone,
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      userphone = text;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      useremail = text;
                    });
                  },
                ),
                TextField(
                  minLines: 3,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Message',
                    prefixIcon: Icon(
                      Icons.message,
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      usermsg = text;
                    });
                  },
                ),
                RaisedButton(
                  onPressed: () async {
                    await sendMsgFunc();
                  },
                  color: isMessageSent
                      ? const Color(0xff1AB260)
                      : const Color(0xff396AFC),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isMessageSent ? Icons.check : Icons.send,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          isMessageSent ? 'Message Sent' : 'SEND',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

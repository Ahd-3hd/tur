import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class SendMessage extends StatefulWidget {
  final String propertyTitle;
  SendMessage({this.propertyTitle});
  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
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
          'propertytitle': widget.propertyTitle,
        });
    setState(() {
      isMessageSent = json.decode(response.body)['status'] == 'mail_sent';
    });
    return json.decode(response.body)['status'] == 'mail_sent';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Send Message',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: const Color(0xff396AFC),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
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
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
                  'Explore',
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
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: Image.asset('assets/logo.png'),
                ),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'About My Turkey Property',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey[700],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'My Turkey property consists of a team of experts who has a vast range of experience in the property market both in the U.K. and in Turkey. Our aim is to ensure that we help, guide and advise you to seeking your dream home within this diverse and rich country called Turkey.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey[700],
                            height: 1.5,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'We offer quality, independent and impartial advice to help you along each step of the property purchase process. We provide you with a portfolio of properties to choose from and information relating to various areas and cities and towns within Turkey so that you can make a well informed decision in choosing a property that fits your requirements and lifestyle. We are also well connected with a good network across Turkey and have a recommended list of people such as lawyers and valuers who can also be brought in to assist at the various stages where they are required. We also have good connections with a variety of lenders if you require this.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey[700],
                            height: 1.5,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'Using our contacts, knowledge and experience we will ensure that you receive the best value on your property as we will work directly with the developer/seller and there will be no other third party involved which could in turn increase costs. Our aim is to always provide customers with the best price on the market for their chosen property.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey[700],
                            height: 1.5,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'My Turkey Property prides itself in providing good customer care and a full service from start to finish.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey[700],
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

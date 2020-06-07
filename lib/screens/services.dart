import 'package:flutter/material.dart';
import 'package:tur/screens/custom_drawer.dart';

class Services extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 0, // THIS WAY IT WILL NOT OPEN
      key: _drawerKey,
      drawer: CustomDrawer(),
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
                  'About',
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
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/legals.png',
                                  width:
                                      MediaQuery.of(context).size.height / 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text('Free Legals'),
                                ),
                                Text(
                                    'We will simplify seemingly complicated procedures'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/mortgage.png',
                                  width:
                                      MediaQuery.of(context).size.height / 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    'Turkish Mortgage',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  'Mortgage available up to 75% of purchase price',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/citizen.png',
                                  width:
                                      MediaQuery.of(context).size.height / 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text('Turkish Citizenship'),
                                ),
                                Text(
                                  'We will ease the process of obtaining the turkish citizenship for eligible clients',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/evaluation.png',
                                  width:
                                      MediaQuery.of(context).size.height / 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    'Free Evaluation',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  'Free detailed evaluation of properties and propertie\'s value',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/citizen.png',
                                  width:
                                      MediaQuery.of(context).size.height / 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text('Turkish Citizenship'),
                                ),
                                Text(
                                  'We will ease the process of obtaining the turkish citizenship for eligible clients',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

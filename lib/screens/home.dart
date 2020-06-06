import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String locationValue;
  String typeValue;
  String maxPriceValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xff396AFC),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Image.asset('assets/homeRect.png'),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/logo.png',
                              width: MediaQuery.of(context).size.width / 2),
                          SizedBox(height: 20),
                          Text(
                            'BUYING PROPERTIES IN TURKEY',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2F3191),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'HAS NEVER BEEN EASIER',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2F3191),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: locationValue,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              hint: Text('Location'),
                              style: TextStyle(color: const Color(0xff396AFC)),
                              underline: Container(
                                height: 2,
                                color: const Color(0xff396AFC),
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  locationValue = newValue;
                                });
                              },
                              items: <String>[
                                'Any',
                                'Istanbul',
                                'Antalia',
                                'Fethiye',
                                'Bursa'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: typeValue,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              hint: Text('Type'),
                              style: TextStyle(color: const Color(0xff396AFC)),
                              underline: Container(
                                height: 2,
                                color: const Color(0xff396AFC),
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  typeValue = newValue;
                                });
                              },
                              items: <String>[
                                'Any',
                                'Apartment',
                                'Pentahouse',
                                'Villa',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: maxPriceValue,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              hint: Text('Max Price'),
                              style: TextStyle(color: const Color(0xff396AFC)),
                              underline: Container(
                                height: 2,
                                color: const Color(0xff396AFC),
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  maxPriceValue = newValue;
                                });
                              },
                              items: <String>[
                                'Any',
                                '50,000',
                                '100,000',
                                '200,000',
                                '400,000',
                                '700,000',
                                '1,000,000',
                                '5,000,000',
                                '10,000,000',
                                '50,000,000',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              onPressed: () {},
                              color: const Color(0xff396AFC),
                              child: Text(
                                'SEARCH',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Image.asset(
                'assets/buildings.png',
                color: const Color(0xff396AFC),
                colorBlendMode: BlendMode.lighten,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tur/screens/single.dart';
import 'package:tur/services/get_properties.dart';

class Feed extends StatefulWidget {
  final List searchValues;
  Feed({this.searchValues});
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  dynamic properties;
  dynamic extractedData;
  bool isContainingResult;
  void getData() async {
    dynamic data = await GetProperties().getData();
    setState(() {
      properties = data;
    });
    await filterProperties();
  }

  Future filterProperties() async {
    List newData = properties.where((entry) {
      List results = [];

      widget.searchValues.forEach((test) {
        if (test[0] == 'price') {
          results.add(int.parse(entry['acf'][test[0]]) <=
              int.parse(test[1].replaceAll(new RegExp(r'[^\w\s]+'), '')));
        } else {
          results.add(entry['acf'][test[0]] == test[1]);
        }
      });

      return !results.contains(false);
    }).toList();
    setState(() {
      extractedData = newData;
      isContainingResult = extractedData.length > 0;
    });
    print(newData.length);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
                flex: 6,
                child: extractedData != null
                    ? isContainingResult
                        ? ListView(
                            children: extractedData
                                .map<Widget>((property) => ItemCard(
                                      data: property,
                                    ))
                                .toList(),
                          )
                        : Text('No Results Found, Please Refine Your Search')
                    : Center(
                        child: Text('Loading ..'),
                      )),
          ],
        ));
  }
}

class ItemCard extends StatelessWidget {
  final dynamic data;
  const ItemCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Single(
                data: data,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Card(
              elevation: 5,
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(data['acf']['image_one']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          data['title']['rendered'],
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff396AFC),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.location_on),
                            Text(
                              data['acf']['location'],
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data['title']['rendered'],
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff396AFC),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.hot_tub,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data['acf']['bathrooms'],
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.hotel,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data['acf']['bedrooms'],
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.open_with,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data['acf']['size'],
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data['acf']['type'],
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Text(
                  '${data['acf']['base_currency']} ${data['acf']['price']}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff396AFC),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            int.parse(data['acf']['price']) > 20000
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/passport.png',
                      width: MediaQuery.of(context).size.width / 5.5,
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

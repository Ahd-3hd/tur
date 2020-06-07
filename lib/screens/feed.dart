import 'package:flutter/material.dart';
import 'package:tur/screens/single.dart';
import 'package:tur/services/get_properties.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  dynamic properties;
  void getData() async {
    dynamic data = await GetProperties().getData();
    setState(() {
      properties = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
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
                'Explore',
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
            flex: 6,
            child: properties != null
                ? ListView(
                    children: properties
                        .map<Widget>((property) => ItemCard(
                              data: property,
                            ))
                        .toList(),
                  )
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

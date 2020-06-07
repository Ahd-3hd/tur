import 'package:http/http.dart';
import 'dart:convert';

class GetProperties {
  List myData;
  Future<dynamic> getData() async {
    Response response = await get(
        'https://myturkeyproperty.com/wp-json/wp/v2/posts?per_page=100&_fields[]=acf&_fields[]=title&_fields[]=id');
    return json.decode(response.body);
    // print(myData[0]['slug']);
    // print(myData[0]['acf']['price']);
    // print(myData[0]['acf']['image_one']);
    // print(myData);
  }
}

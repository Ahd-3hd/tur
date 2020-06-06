import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullImage extends StatelessWidget {
  final String imageurl;
  FullImage({this.imageurl});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: PhotoView(
          imageProvider: NetworkImage(imageurl),
        ));
  }
}

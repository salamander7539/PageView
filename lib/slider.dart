import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderPage extends StatelessWidget {

  final String image;

  SliderPage({this.image});

  @override
  Widget build(BuildContext context) {
    double wight = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Image.asset(image, width: wight),
        ],
      ),
    );
  }
}

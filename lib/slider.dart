import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
          Expanded(child: Image.asset(image, width: wight)),
        ],
      ),
    );
  }
}

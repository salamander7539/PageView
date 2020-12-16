import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_view/pages.dart';

import 'main.dart';

class Preload extends StatefulWidget {
  @override
  _PreloadState createState() => _PreloadState();
}

class _PreloadState extends State<Preload> {

  @override
  void initState() {
    // TODO: implement initState
    new Timer(const Duration(seconds: 5), onClose);
    super.initState();
  }

  void onClose() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => new RestaurantPage(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preload',
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image(
            image: AssetImage(delivery_logo),
          ),
        ),
      ),
    );
  }
}

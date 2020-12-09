import 'package:flutter/material.dart';
import 'package:page_view/pages.dart';
import 'package:page_view/slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView',
      home: MyHomePage(title: 'PageView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentPage = 0;


  final List<Widget> pageNumber = [
    SliderPage(
      image: pizza,
    ),
    SliderPage(
      image: sandwich,
    ),
    SliderPage(
      image: cola,
    ),
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  _pageView() {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: PageController(),
          itemCount: pageNumber.length,
            onPageChanged: _onChanged,
            itemBuilder: (BuildContext context, int index) {
            return pageNumber[index];
        }),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(pageNumber.length, (int index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 10,
                  width: (index == _currentPage) ? 30 : 10,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (index == _currentPage) ? Colors.blue : Colors.blue.withOpacity(0.5),
                  ),
                );
              }),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
        centerTitle: true,
      ),
      body: _pageView(),
    );
  }
}

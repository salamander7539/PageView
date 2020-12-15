import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view/pages.dart';
import 'package:page_view/slider.dart';

void main() => runApp(MyApp());

Color mainColor = Color(0xFFB8B8B8);

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

final items = List<String>.generate(5, (i) => "Item ${i + 1}");

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;
  bool visible;
  int chosenItem = 0;
  double height;

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

  _buildFilterNavigationMenu() {

    return Container(
      child: Column(
        children: [
          Visibility(
            visible: visible,
            child: Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 15),
                          child: Text(
                            'Название ресторана',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // IconButton(icon: null, onPressed: null)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 8.0),
                      child: ListView.builder(
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 16.0),
                              child: Container(
                                height: 26.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE6E6E6),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: FloatingActionButton(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0.0,
                                  onPressed: () {},
                                  child: Text(
                                    items[index],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  iconSize: 40.0,
                  onPressed: null,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: ListView.builder(
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 16.0),
                            child: Container(
                              height: 26.0,
                              decoration: BoxDecoration(
                                color: (chosenItem == index)
                                    ? Color(0xFFE6E6E6)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: FloatingActionButton(
                                backgroundColor: Colors.transparent,
                                elevation: 0.0,
                                onPressed: () {
                                  setState(() {
                                    chosenItem = index;
                                  });
                                },
                                child: Text(
                                  items[index],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.25,
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, position) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 150,
                            child: Card(
                              child: Container(
                                child: ListTile(
                                  title: Text('Title', style: TextStyle(fontSize: 30.0),),
                                  subtitle: Text('Subtitle'),
                                  trailing: Image.asset(pizza),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  _pageView() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.27,
          child: Stack(
            children: <Widget>[
              PageView.builder(
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
                    children:
                        List<Widget>.generate(pageNumber.length, (int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 25 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? mainColor
                              : mainColor.withOpacity(0.5),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              Visibility(
                visible: visible,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                    onPressed: null,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        NotificationListener<DraggableScrollableNotification>(
          // ignore: missing_return
          onNotification: (notification) {
            if (notification.extent == 1.0) {
              visible = false;
            } else {
              visible = true;

            }
          },
          child: DraggableScrollableSheet(
              minChildSize: 0.7,
              initialChildSize: 0.7,
              maxChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  child: ListView.builder(
                      itemCount: 1,
                      controller: scrollController,
                      itemBuilder: (BuildContext context, index) {
                        return _buildFilterNavigationMenu();
                      }),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      )),
                );
              }),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    visible = true;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
        backgroundColor: mainColor,
        centerTitle: true,
      ),
      body: _pageView(),
    );
  }
}

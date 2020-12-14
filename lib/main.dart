import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool visible;

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
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'Text',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15),
              child: Text(
                'Отобразить сначала',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            title: Text('Доверюсь вам'),
          ),
          ListTile(
            title: Text('С высоким рейтингом'),
          ),
          ListTile(
            title: Text('Быстрые'),
          ),
          ListTile(
            title: Text('Недорогие'),
          ),
          ListTile(
            title: Text('Дорогие'),
          ),
          FlatButton(
            child: Text('Готово',
                style: TextStyle(fontSize: 18.0, color: Color(0xFF000000))),
            color: Color(0xFFE6E6E6),
            splashColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding:
                EdgeInsets.only(left: 140, top: 20, right: 140, bottom: 20),
            onPressed: () async {
              Navigator.pop(context);
            },
          )
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
                              ? Colors.blue
                              : Colors.blue.withOpacity(0.5),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
        NotificationListener<DraggableScrollableNotification>(
          // ignore: missing_return
          onNotification: (notification) {
            print("${notification.extent}");
            if (notification.extent == 1.0) {
              setState(() {
                visible = false;
              });
            } else {
              setState(() {
                visible = true;
              });
            }
          },
          child: DraggableScrollableSheet(
              minChildSize: 0.7,
              initialChildSize: 0.7,
              maxChildSize: 1.0,
              builder: (BuildContext context, ScrollController scrollController) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
        centerTitle: true,
      ),
      body: _pageView(),
    );
  }
}

import 'package:flutter/material.dart';

final BoxDecoration bDec = BoxDecoration(
  border: Border.all(
    width: 1,
    color: Colors.blue,
  ),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey[900]),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: bDec,
              height: 100,
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: bDec,
              height: 50,
            ),
            Container(
              height: 300,
              margin: EdgeInsets.all(10),
              decoration: bDec,
              child: Column(
                children: <Widget>[
                  TabBar(
                    tabs: [
                      Container(height: 20, child: Text('Tab 1')),
                      Container(height: 20, child: Text('Tab 2')),
                      Container(height: 20, child: Text('Tab 3'))
                    ],
                    controller: tabController,
                    isScrollable: true,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: <Widget>[
                        Container(
                          color: Colors.blue[200],
                          child: Center(
                            child: Text('Content 2',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        Container(
                          color: Colors.blue[300],
                          child: Center(
                            child: Text('Content 2',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        Container(
                          color: Colors.blue[400],
                          child: Center(
                            child: Text('Content 3',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: bDec,
              height: 170,
            ),
          ],
        ),
      ),
    );
  }
}

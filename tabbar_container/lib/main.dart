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
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey[900]),
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
                margin: EdgeInsets.all(10),
                decoration: bDec,
                child: Column(children: <Widget>[
                  TabBar(
                    tabs: [
                      Container(height: 20, child: Text('Tab 1')),
                      Container(height: 20, child: Text('Tab 2')),
                      Container(height: 20, child: Text('Tab 3'))
                    ],
                    controller: tabController,
                    onTap: (int index) {
                      setState(() {
                        selectedIndex = index;
                        tabController.animateTo(index);
                      });
                    },
                  ),
                  Divider(height: 0),
                  IndexedStack(
                    children: <Widget>[
                      Visibility(
                        child: Container(
                          height: 200,
                          color: Colors.blue[100],
                          child: Center(
                            child: Text('Content 1',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        maintainState: true,
                        visible: selectedIndex == 0,
                      ),
                      Visibility(
                        child: Container(
                          height: 300,
                          color: Colors.blue[200],
                          child: Center(
                            child: Text('Content 2',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        maintainState: true,
                        visible: selectedIndex == 1,
                      ),
                      Visibility(
                        child: Container(
                          height: 400,
                          color: Colors.blue[300],
                          child: Center(
                            child: Text(
                              'Content 3',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        maintainState: true,
                        visible: selectedIndex == 2,
                      ),
                    ],
                    index: selectedIndex,
                  ),
                ])),
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

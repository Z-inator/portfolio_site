import 'package:flutter/material.dart';

import 'screens/main_body_content.dart';
import 'screens/nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ScrollingPage()
    );
  }
}

class ScrollingPage extends StatelessWidget {
  const ScrollingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: Row(
            children: [
              LeftNavBar(),
              Expanded(child: MainContentBody())
            ],
          ),
        )),
    );
  }
}




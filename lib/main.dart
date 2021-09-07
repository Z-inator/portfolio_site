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
          primarySwatch: Colors.cyan,
        ),
        home: ResponsiveScreen());
  }
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({Key? key}) : super(key: key);

  Widget getScreen(Size screenSize) {
    if (screenSize.width >= 1200) {
      return LargeScreen();
    } else if (screenSize.width > 800 && screenSize.width < 1200) {
      return MediumScreen();
    } else {
      return SmallScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return getScreen(MediaQuery.of(context).size);
  }
}

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [Expanded(child: MainContentBody())],
              ))),
    );
  }
}

class MediumScreen extends StatelessWidget {
  MediumScreen({Key? key}) : super(key: key);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
        body: Row(
          children: [
            LeftNavBar(),
            VerticalDivider(),
            Expanded(child: MainContentBody())
          ],
        ),
      )),
    );
  }
}

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
        body: Row(
          children: [
            LeftNavBar(),
            // VerticalDivider(),
            Expanded(child: MainContentBody())
          ],
        ),
      )),
    );
  }
}

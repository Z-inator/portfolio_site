import 'package:flutter/material.dart';
import 'package:portfolio_site/screens/small_screen.dart';

import 'package:portfolio_site/screens/main_body_content.dart';
import 'package:portfolio_site/screens/nav_bar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: PageViewDemo(),
        ),
      ),
    );
  }
}

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        MyPage1Widget(),
        MyPage2Widget(),
        MyPage3Widget(),
      ],
    );
  }
}

class MyPage1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkGreen, height: 50),
          ],
        ),
        Row(
          children: [
            MyBox(lightGreen),
            MyBox(lightGreen),
          ],
        ),
        MyBox(mediumGreen, text: 'PageView 1'),
        Row(
          children: [
            MyBox(lightGreen, height: 200),
            MyBox(lightGreen, height: 200),
          ],
        ),
      ],
    );
  }
}

class MyPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkBlue, height: 50),
            MyBox(darkBlue, height: 50),
          ],
        ),
        Row(
          children: [
            MyBox(lightBlue),
            MyBox(lightBlue),
          ],
        ),
        MyBox(mediumBlue, text: 'PageView 2'),
        Row(
          children: [
            MyBox(lightBlue),
            MyBox(lightBlue),
          ],
        ),
      ],
    );
  }
}

class MyPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            MyBox(darkRed),
            MyBox(darkRed),
          ],
        ),
        MyBox(mediumRed, text: 'PageView 3'),
        Row(
          children: [
            MyBox(lightRed),
            MyBox(lightRed),
            MyBox(lightRed),
          ],
        ),
      ],
    );
  }
}

const lightBlue = Color(0xff00bbff);
const mediumBlue = Color(0xff00a2fc);
const darkBlue = Color(0xff0075c9);

final lightGreen = Colors.green.shade300;
final mediumGreen = Colors.green.shade600;
final darkGreen = Colors.green.shade900;

final lightRed = Colors.red.shade300;
final mediumRed = Colors.red.shade600;
final darkRed = Colors.red.shade900;

class MyBox extends StatelessWidget {
  final Color color;
  final double? height;
  final String? text;

  MyBox(this.color, {this.height, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        color: color,
        height: (height == null) ? 150 : height,
        child: (text == null)
            ? null
            : Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: themeData(ThemeData.light()),
//         home: ResponsiveScreen());
//   }
// }

ThemeData themeData(ThemeData base) {
  return base.copyWith(
    primaryColor: Colors.cyan,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(25))),
    )
  );
}

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({Key? key}) : super(key: key);

  Widget getScreen(Size screenSize) {
    bool isShort = false;
    if (screenSize.height < 760) {
      isShort = true;
    }
    if (screenSize.width >= 1200) {
      return LargeScreen(isShort: isShort);
    } else if (screenSize.width > 800 && screenSize.width < 1200) {
      return MediumScreen(isShort: isShort);
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
            drawer: Drawer(
              child: DrawerNavBar(),
            ),
              appBar: AppBar(),
              body: SmallBodyContent())),
    );
  }
}

class MediumScreen extends StatelessWidget {
  final bool isShort;
  MediumScreen({Key? key, required this.isShort}) : super(key: key);
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
  final bool isShort;
  const LargeScreen({Key? key, required this.isShort}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 250, child: LeftNavBar()),
              Expanded(flex: 5, child: MainContentBody())
            ],
          )
        // isShort
        //     ? Row(
        //         children: [
        //           Flexible(flex: 1, child: LeftNavBar()),
        //           Expanded(flex: 5, child: MainContentBody())
        //         ],
        //       )
        //     : Column(
        //         children: [TopNavBar(), Expanded(child: MainContentBody())],
        //       )
      )),
    );
  }
}

// class TopNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         LogoHeader(),
//         Row(
//           children: [
//             PageItem(pageName: 'About Me'),
//             PageItem(pageName: 'Projects'),
//             PageItem(pageName: 'Contact')
//           ],
//         ),
//         LinkList()
//       ],
//     );
//   }
// }

// class PageItem extends StatefulWidget {
//   String pageName;
//   PageItem({Key? key, required this.pageName}) : super(key: key);

//   @override
//   _PageItemState createState() => _PageItemState();
// }

// class _PageItemState extends State<PageItem> {
//   bool isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             isSelected = !isSelected;
//           });
//         },
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Icon(Icons.circle, color: isSelected ? Colors.cyan : Colors.grey),
//             Text(
//               widget.pageName,
//               style: TextStyle(color: isSelected ? Colors.cyan : Colors.grey),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

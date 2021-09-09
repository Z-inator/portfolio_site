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
              appBar: AppBar(),
              body: Column(
                children: [Expanded(child: MainContentBody())],
              ))),
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

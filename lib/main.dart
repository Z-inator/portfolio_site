import 'package:flutter/material.dart';
import 'package:portfolio_site/screens/small_screen.dart';

import 'package:portfolio_site/screens/main_body_content.dart';
import 'package:portfolio_site/screens/nav_bar.dart';

import 'components/project_grid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: themeData(ThemeData.light()),
        home: ResponsiveScreen());
  }
}

ThemeData themeData(ThemeData base) {
  return base.copyWith(
      primaryColor: Colors.cyan,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ));
}

class ResponsiveScreen extends StatelessWidget {
  ResponsiveScreen({Key? key}) : super(key: key);

  List<Project> projects = List.generate(
      5,
      (index) => Project(
          'name$index',
          'description',
          Image(
            image: AssetImage('dashboard.png'),
          ),
          'tools',
          'takeAways'));

  Widget getScreen(Size screenSize) {
    bool isShort = false;
    if (screenSize.height < 760) {
      isShort = true;
    }
    if (screenSize.width >= 1200) {
      return LargeScreen(isShort: isShort, projects: projects);
    } else if (screenSize.width > 800 && screenSize.width < 1200) {
      return MediumScreen(isShort: isShort, projects: projects);
    } else {
      return SmallScreen(projects: projects);
    }
  }

  @override
  Widget build(BuildContext context) {
    return getScreen(MediaQuery.of(context).size);
  }
}

class SmallScreen extends StatelessWidget {
  final List<Project> projects;
  SmallScreen({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
              drawer: Drawer(
                child: DrawerNavBar(),
              ),
              appBar: AppBar(),
              body: SmallBodyContent(projects: projects))),
    );
  }
}

class MediumScreen extends StatelessWidget {
  final bool isShort;
  final List<Project> projects;
  MediumScreen({Key? key, required this.isShort, required this.projects}) : super(key: key);
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
            Expanded(child: MainContentBody(projects: projects))
          ],
        ),
      )),
    );
  }
}

class LargeScreen extends StatelessWidget {
  final bool isShort;
  final List<Project> projects;
  const LargeScreen({Key? key, required this.isShort, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
              body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(width: 250, child: LeftNavBar()),
          Expanded(flex: 5, child: MainContentBody(projects: projects))
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

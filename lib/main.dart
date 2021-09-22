import 'package:flutter/material.dart';
import 'package:portfolio_site/Services/project_services.dart';
import 'package:portfolio_site/screens/small_screen.dart';

import 'package:portfolio_site/screens/large_screen.dart';
import 'package:portfolio_site/screens/nav_bar.dart';
import 'package:provider/provider.dart';

import 'components/project_views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ProjectState>(
      create: (context) => ProjectState(),
      dispose: (context, value) => value.dispose(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: themeData(ThemeData.light()),
          home: AdaptiveScaffold()),
    );
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

bool _isLargeScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 960.0;
}

class AdaptiveScaffold extends StatefulWidget {
  AdaptiveScaffold({Key? key,})
      : super(key: key);

  @override
  _AdaptiveScaffoldState createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  @override
  Widget build(BuildContext context) {
    if (_isLargeScreen(context)) {
      return Row(
        children: [
          LeftNavBar(drawerWidgets: [
            LogoHeader(),
            PageList(),
            LinkList()
          ]),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Expanded(child: LargeScreenBody())
        ],
      );
    }
    return SafeArea(
        child: Scaffold(
            drawer: DrawerNavBar(drawerWidgets: [
              LogoHeader(),
                  PageList(),
                  LinkList()
            ]
          ),
            appBar: AppBar(),
            body: SmallScreenBody()));
  }
}

// class ResponsiveScreen extends StatelessWidget {
//   ResponsiveScreen({Key? key}) : super(key: key);

//   List<Project> projects = List.generate(
//       5,
//       (index) => Project(
//           'name$index',
//           'description',
//           Image(
//             image: AssetImage('dashboard.png'),
//           ),
//           'tools',
//           'takeAways'));

//   Widget getScreen(Size screenSize) {
//     if (screenSize.width >= 800) {
//       return LargeScreen();
//     } else {
//       return SmallScreen();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return getScreen(MediaQuery.of(context).size);
//   }
// }

// class SmallScreen extends StatelessWidget {
//   SmallScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SafeArea(
//           child: Scaffold(
//               drawer: Drawer(
//                 child: DrawerNavBar(),
//               ),
//               appBar: AppBar(),
//               body: SmallScreenBody())),
//     );
//   }
// }

// class LargeScreen extends StatelessWidget {
//   const LargeScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         LeftNavBar(drawerWidgets: [
//           DrawerHeader(child: LogoHeader()),
//           PageList(),
//           LinkList()
//         ]),
//         Expanded(flex: 5, child: LargeScreenBody())
//       ],
//       // isShort
//       //     ? Row(
//       //         children: [
//       //           Flexible(flex: 1, child: LeftNavBar()),
//       //           Expanded(flex: 5, child: MainContentBody())
//       //         ],
//       //       )
//       //     : Column(
//       //         children: [TopNavBar(), Expanded(child: MainContentBody())],
//       //       )
//     );
//   }
// }

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

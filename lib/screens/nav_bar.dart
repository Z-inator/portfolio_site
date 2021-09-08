import 'dart:html';

import 'package:flutter/material.dart';


class LeftNavBar extends StatelessWidget {
  const LeftNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16,
      borderRadius: BorderRadius.zero,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LogoHeader(),
            PageList(),
            // Expanded(
            //   child: NavigationRail(
            //     selectedIndex: 0,
            //     groupAlignment: 0,
            //     labelType: NavigationRailLabelType.all,
            //     // leading: LogoHeader(),
            //     // trailing: LinkList(),
            //     destinations: [
            //       NavigationRailDestination(icon: Icon(Icons.access_alarm_outlined), selectedIcon: Icon(Icons.access_alarm), label: Text('About Me')),
            //       NavigationRailDestination(icon: Icon(Icons.access_alarm_outlined), selectedIcon: Icon(Icons.access_alarm), label: Text('Projects')),
            //       NavigationRailDestination(icon: Icon(Icons.access_alarm_outlined), selectedIcon: Icon(Icons.access_alarm), label: Text('Contact')),
            //     ]
            //   ),
            // ),
            Expanded(child: LinkList())
          ],
        ),
      ),
    );
  }
}

// class LeftNavBar extends StatelessWidget {
//   const LeftNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       color: Colors.cyan,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           LogoHeader(),
//           Expanded(child: PageList()),
//           Expanded(child: LinkList()),
//         ],
//       ),
//     );
//   }
// }

class LogoHeader extends StatelessWidget {
  const LogoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      // width: 160,
      // height: 160,
      decoration: ShapeDecoration(
          color: Colors.cyan,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      child: Center(child: Text('Z', style: Theme.of(context).textTheme.headline1)),
    );
  }
}

class PageList extends StatelessWidget {
  PageList({Key? key}) : super(key: key);

  final List pages = [
    'About Me',
    'Projects',
    'Contact',
    // 'Interests',
    // 'Links'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              selected: true,
              selectedTileColor: Colors.cyan,
              leading: Icon(Icons.circle),
              title: Text('About Me'),
            ),
            ListTile(
              selected: false,
              selectedTileColor: Colors.cyan,
              leading: Icon(Icons.circle),
              title: Text('Projects'),
            ),
            ListTile(
              selected: false,
              selectedTileColor: Colors.cyan,
              leading: Icon(Icons.circle),
              title: Text('Contact'),
            ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: pages.length,
            //       itemBuilder: (context, index) {
            //         return Column(
            //           children: [
            //             ListTile(
            //                 title: Text(pages[index]),
            //                 onTap: () {},
            //             ),
            //             Divider()
            //           ],
            //         );
            //       }),
            // ),
          ],
        ));
  }
}

class LinkList extends StatelessWidget {
  const LinkList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.end,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(4, (index) => IconButton(onPressed: () {}, icon: Icon(Icons.circle))),
    );
  }
}

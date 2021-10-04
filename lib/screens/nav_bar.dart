import 'dart:html';

import 'package:flutter/material.dart';
import 'package:portfolio_site/components/project_views.dart';
import 'package:portfolio_site/main.dart';
import 'package:portfolio_site/screens/large_screen.dart';

class DrawerNavBar extends StatelessWidget {
  final List<Widget> drawerWidgets;
  const DrawerNavBar({Key? key, required this.drawerWidgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: drawerWidgets),
    );
  }
}

class NavTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController tabController;
  const NavTabBar({Key? key, required this.tabs, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FocusTraversalOrder(
        order: NumericFocusOrder(0),
        child: TabBar(
            tabs: tabs,
            // isScrollable: true,
            controller: tabController,
            indicatorColor: theme.primaryColor,
            indicatorWeight: 3));
  }
}

class TopNavBar extends StatelessWidget {
  final TabController tabController;
  const TopNavBar({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16,
      borderRadius: BorderRadius.zero,
      clipBehavior: Clip.hardEdge,
      child: NavTabBar(tabs: _buildSmallTabs(), tabController: tabController)
    );
    NavTabBar(tabs: _buildSmallTabs(), tabController: tabController);
    // 
  }
}

class LeftNavBar extends StatelessWidget {
  final TabController tabController;

  LeftNavBar({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20),
        width: 200,
        child: Material(
            elevation: 8.0,
            borderRadius: BorderRadius.zero,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LogoHeader(),
                RotatedBox(
                  quarterTurns: 1,
                  child: NavTabBar(
                    tabs: _buildLargeTabs(tabController: tabController)
                        .map((widget) => RotatedBox(
                              quarterTurns: 3,
                              child: widget,
                            ))
                        .toList(),
                    tabController: tabController,
                  ),
                ),
                LinkList()
              ],
            )));
  }
}

List<Widget> _buildSmallTabs() {
  return [
    Tab(
      text: 'HOME',
      icon: Icon(Icons.home_rounded),
      // child: NavigationItem(icon: Icon(Icons.home_rounded), name: 'home', index: 0, tabController: tabController,)),
    ),
    Tab(
      text: 'ABOUT',
      icon: Icon(Icons.person_rounded),
      // child: NavigationItem(icon: Icon(Icons.person_rounded), name: 'about', index: 1, tabController: tabController)
    ),
    Tab(
      text: 'PROJECTS',
      icon: Icon(Icons.topic_rounded),
      // child: NavigationItem(icon: Icon(Icons.topic_rounded), name: 'projects', index: 2, tabController: tabController)
    ),
    Tab(
      text: 'CONTACT',
      icon: Icon(Icons.message_rounded),
      // child: NavigationItem(icon: Icon(Icons.message_rounded), name: 'contact', index: 3, tabController: tabController)
    ),
  ];
}

List<Widget> _buildLargeTabs({required TabController tabController}) {
  return [
    Tab(
        // iconMargin: EdgeInsets.zero,
        child: NavigationItem(
      icon: Icon(Icons.home_rounded),
      name: 'home',
      index: 0,
      tabController: tabController,
    )),
    Tab(
        child: NavigationItem(
            icon: Icon(Icons.person_rounded),
            name: 'about',
            index: 1,
            tabController: tabController)),
    Tab(
        child: NavigationItem(
            icon: Icon(Icons.topic_rounded),
            name: 'projects',
            index: 2,
            tabController: tabController)),
    Tab(
        child: NavigationItem(
            icon: Icon(Icons.message_rounded),
            name: 'contact',
            index: 3,
            tabController: tabController)),
  ];
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
      decoration: ShapeDecoration(
          color: Colors.cyan,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      child: Center(
          child: Text('Z', style: Theme.of(context).textTheme.headline1)),
    );
  }
}

class PageList extends StatelessWidget {
  PageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            // NavigationItem(icon: Icon(Icons.home_rounded), name: 'home'),
            // NavigationItem(icon: Icon(Icons.person_rounded), name: 'about'),
            // NavigationItem(icon: Icon(Icons.topic_rounded), name: 'projects'),
            // NavigationItem(icon: Icon(Icons.message_rounded), name: 'contact'),

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

class NavigationItem extends StatefulWidget {
  final Icon icon;
  final String name;
  final TabController tabController;
  final int index;
  const NavigationItem({
    Key? key,
    required this.icon,
    required this.name,
    required this.tabController,
    required this.index,
  }) : super(key: key);

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  // @override
  // void didUpdateWidget(covariant NavigationItem oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  // }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      // height: 60,
      padding: EdgeInsets.symmetric(horizontal: 30),
      // color: widget.index == widget.tabController.index
      //     ? theme.primaryColor
      //     : Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          widget.icon,
          SizedBox(
            width: 30,
          ),
          Text(widget.name.toUpperCase(), style: theme.textTheme.subtitle1)
        ],
      ),
    );
    // ListTile(
    //     selected: widget.index == widget.tabController.index,
    //     enabled: false,
    //     selectedTileColor: Colors.cyan,
    //     leading: widget.icon,
    //     title: Text(widget.name..toUpperCase()),
    //     onTap: () =>
    //         Navigator.pushReplacementNamed(context, '/${widget.name}'));
  }
}

class LinkList extends StatelessWidget {
  const LinkList({Key? key}) : super(key: key);

  void launchURL(String url) {
    window.open(url, 'new tab');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () =>
                launchURL('https://www.linkedin.com/in/zacharywauer/'),
            icon: Image.asset('logos/linkedin.png'),
            // iconSize: 36,
            // AssetImage('logos/linkedin.png'),
          ),
          IconButton(
            onPressed: () => launchURL('https://github.com/Z-inator'),
            icon: Image.asset('logos/github.png'),
            // iconSize: 36,
            // CircleAvatar(
            //   radius: 20,
            //   foregroundImage: AssetImage('logos/github.png'),
            //   backgroundColor: Colors.white,
          ),
          IconButton(
            onPressed: () => launchURL('https://twitter.com/ZachWauer'),
            icon: Image.asset('logos/twitter.png'),
            // iconSize: 36,
            // CircleAvatar(
            //   radius: 20,
            //   foregroundImage: AssetImage('logos/twitter.png'),
            //   backgroundColor: Colors.white,
          ),
        ]);
    // Wrap(
    //   direction: Axis.vertical,
    //   alignment: WrapAlignment.end,
    //   runAlignment: WrapAlignment.center,
    //   crossAxisAlignment: WrapCrossAlignment.center,
    //   children: List.generate(4, (index) => IconButton(onPressed: () {}, icon: Icon(Icons.circle))),
    // );
  }
}

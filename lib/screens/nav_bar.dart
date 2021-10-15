import 'dart:html';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController tabController;
  final bool isScrollable;
  const NavTabBar(
      {Key? key,
      required this.tabs,
      required this.tabController,
      required this.isScrollable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FocusTraversalOrder(
        order: NumericFocusOrder(0),
        child: TabBar(
            tabs: tabs,
            isScrollable:
                isScrollable, // Allows for mobile version to expand to fill width
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
        child: NavTabBar(
            tabs: _buildSmallTabs(),
            tabController: tabController,
            isScrollable: false));
  }
}

class LeftNavBar extends StatelessWidget {
  final TabController tabController;

  LeftNavBar({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
                      isScrollable: true,)
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
    ),
    Tab(
      text: 'ABOUT',
      icon: Icon(Icons.person_rounded),
    ),
    Tab(
      text: 'PROJECTS',
      icon: Icon(Icons.topic_rounded),
    ),
    Tab(
      text: 'CONTACT',
      icon: Icon(Icons.message_rounded),
    ),
  ];
}

List<Widget> _buildLargeTabs({required TabController tabController}) {
  return [
    Tab(
        child: NavigationItem(
            icon: Icon(Icons.home_rounded),
            name: 'home')),
    Tab(
        child: NavigationItem(
            icon: Icon(Icons.person_rounded),
            name: 'about')),
    Tab(
        child: NavigationItem(
            icon: Icon(Icons.topic_rounded),
            name: 'projects')),
    Tab(
        child: NavigationItem(
            icon: Icon(Icons.message_rounded),
            name: 'contact')),
  ];
}

class LogoHeader extends StatelessWidget {
  const LogoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(20),
      decoration: ShapeDecoration(
          color: theme.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      child: Center(
          child: Text('Z', style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white))),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final Icon icon;
  final String name;
  const NavigationItem({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          icon,
          SizedBox(
            width: 30,
          ),
          Text(name.toUpperCase())
        ],
      ),
    );
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
            icon: Icon(MdiIcons.linkedin),
          ),
          IconButton(
            onPressed: () => launchURL('https://github.com/Z-inator'),
            icon: Icon(MdiIcons.github),
          ),
          IconButton(
            onPressed: () => launchURL('https://twitter.com/ZachWauer'),
            icon: Icon(MdiIcons.twitter),
          ),
        ]);
  }
}

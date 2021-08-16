import 'package:flutter/material.dart';

class LeftNavBar extends StatelessWidget {
  const LeftNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          LogoHeader(),
          Expanded(child: PageList()),
          Expanded(child: LinkList()),
        ],
      ),
    );
  }
}

class LogoHeader extends StatelessWidget {
  const LogoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 160,
      height: 160,
      decoration: ShapeDecoration(
          color: Colors.white,
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
        child: Column(
          children: [
            Divider(),
            Expanded(
              child: ListView.builder(
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                            title: Text(pages[index]),
                            onTap: () {},
                        ),
                        Divider()
                      ],
                    );
                  }),
            ),
          ],
        ));
  }
}

class LinkList extends StatelessWidget {
  const LinkList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Icon(Icons.circle);
      }),
    );
  }
}

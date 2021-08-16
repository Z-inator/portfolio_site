import 'package:flutter/material.dart';

class LeftNavBar extends StatelessWidget {
  const LeftNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          LogoHeader(),
          PageList(),
          LinkList(),
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
      decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(45))),
      child: Text('Z', style: Theme.of(context).textTheme.headline6),
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
        child: ListView.builder(
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(horizontal: BorderSide())),
                child: ListTile(
                  title: Text(pages[index]),
                  onTap: () {},
                ),
              );
            }));
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

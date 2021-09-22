import 'package:flutter/material.dart';

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

class LeftNavBar extends StatelessWidget {
  final List<Widget> drawerWidgets;

  LeftNavBar({Key? key, required this.drawerWidgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: drawerWidgets),
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
            ListTile(
              selected: true,
              // selectedTileColor: Colors.cyan,
              leading: Icon(Icons.circle),
              title: Text('Home'),
            ),
            ListTile(
              selected: false,
              // selectedTileColor: Colors.cyan,
              leading: Icon(Icons.circle),
              title: Text('About Me'),
            ),
            ListTile(
              selected: false,
              // selectedTileColor: Colors.cyan,
              leading: Icon(Icons.circle),
              title: Text('Projects'),
            ),
            ListTile(
              selected: false,
              // selectedTileColor: Colors.cyan,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
          4, (index) => IconButton(onPressed: () {}, icon: Icon(Icons.circle))),
    );
    // Wrap(
    //   direction: Axis.vertical,
    //   alignment: WrapAlignment.end,
    //   runAlignment: WrapAlignment.center,
    //   crossAxisAlignment: WrapCrossAlignment.center,
    //   children: List.generate(4, (index) => IconButton(onPressed: () {}, icon: Icon(Icons.circle))),
    // );
  }
}

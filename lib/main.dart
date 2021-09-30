import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Services/contact_form_services.dart';
import 'package:portfolio_site/Services/project_services.dart';
import 'package:portfolio_site/screens/small_screen.dart';

import 'package:portfolio_site/screens/large_screen.dart';
import 'package:portfolio_site/screens/nav_bar.dart';
import 'package:provider/provider.dart';

import 'components/project_views.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'),);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return PortfolioApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class PortfolioApp extends StatelessWidget {
  PortfolioApp({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ProjectState>(
            create: (context) => ProjectState(),
            dispose: (context, value) => value.dispose(),
          ),
          ChangeNotifierProvider(
            create: (context) => ContactFormState(formKey: formKey),
          )
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: themeData(ThemeData.light()),
            // home: AdaptiveScaffold(),
            initialRoute: '/',
            routes: {
              '/': (context) => AdaptiveScaffold(),
              // '/about': (context) => AboutMe(),
              // '/projects': (context) => ProjectPageView(),
              // '/contact': (context) => LargeContactSection()
            },
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/home':
                  return SlideRightRoute(page: AdaptiveScaffold());
                case '/about':
                  return SlideRightRoute(page: AboutMe());
                case '/projects':
                  return SlideRightRoute(page: ProjectPageView());
                case '/contact':
                  return SlideRightRoute(page: LargeContactSection());
                default:
                  return SlideRightRoute(page: UnknownRoute());
              }
            },
        ),
      );
  }
}

class UnknownRoute extends StatelessWidget {
  const UnknownRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text('404: Page not found'),),);
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
    : super(
      pageBuilder: (
        BuildContext context, 
        Animation<double> animation, 
        Animation<double> secondaryAnimation
      ) => page,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) => SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1, 0),
          end: Offset.zero
        ).animate(animation),
        child: child,
      )
    );
}

ThemeData themeData(ThemeData base) {
  return base.copyWith(
    primaryColor: Colors.cyan,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      filled: true,
      fillColor: Colors.grey[200],
      focusColor: Colors.cyan,
    ),
  );
}

bool _isLargeScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 960.0;
}

class AdaptiveScaffold extends StatefulWidget {
  AdaptiveScaffold({
    Key? key,
  }) : super(key: key);

  @override
  _AdaptiveScaffoldState createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  @override
  Widget build(BuildContext context) {
    if (_isLargeScreen(context)) {
      return Container(
        color: Theme.of(context).canvasColor,
        child: Row(
          children: [
            LeftNavBar(drawerWidgets: [LogoHeader(), PageList(), LinkList()]),
            // VerticalDivider(
            //   width: 1,
            //   thickness: 1,
            //   color: Colors.grey[300],
            // ),
            Expanded(
              child: Navigator(
                on
                child: LargeScreenBody()
              )
            )
          ],
        ),
      );
    }
    return SafeArea(
        child: Scaffold(
            drawer: DrawerNavBar(
                drawerWidgets: [LogoHeader(), PageList(), LinkList()]),
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

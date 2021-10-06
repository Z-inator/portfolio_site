import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Services/contact_form_services.dart';
import 'package:portfolio_site/Services/project_services.dart';
import 'package:portfolio_site/components/about_me_views.dart';
import 'package:portfolio_site/screens/small_screen.dart';

import 'package:portfolio_site/screens/large_screen.dart';
import 'package:portfolio_site/screens/nav_bar.dart';
import 'package:provider/provider.dart';

import 'components/project_views.dart';
import 'education_and_certifications.dart' as education;


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
          return Center(
            child: Text('Something went wrong'),
          );
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
        Provider<List<education.Certificate>>.value(value: education.certificates),
        Provider<List<education.School>>.value(value: education.schools),
        ChangeNotifierProvider(
          create: (context) => ContactFormState(formKey: formKey),
        )
      ],
      child: MaterialApp(
        title: 'Portfolio Site',
        theme: themeData(ThemeData.light()),
        home: HomePage(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => AdaptiveScaffold(),
        //   // '/about': (context) => AboutMe(),
        //   // '/projects': (context) => ProjectPageView(),
        //   // '/contact': (context) => LargeContactSection()
        // },
        // onGenerateRoute: (settings) {
        //   switch (settings.name) {
        //     case '/home':
        //       return SlideRightRoute(page: AdaptiveScaffold());
        //     case '/about':
        //       return SlideRightRoute(page: AboutMe());
        //     case '/projects':
        //       return SlideRightRoute(page: ProjectPageView());
        //     case '/contact':
        //       return SlideRightRoute(page: LargeContactSection());
        //     default:
        //       return SlideRightRoute(page: UnknownRoute());
        //   }
        // },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController tabController;
  RestorableInt tabIndex = RestorableInt(0);

  @override
  String? get restorationId => 'home_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        setState(() {
          tabIndex.value = tabController.index;
        });
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = _isLargeScreen(context);
    Widget tabBarView;
    if (isDesktop) {
      tabBarView = Row(children: [
        LeftNavBar(tabController: tabController),
        Expanded(
            child: TabBarView(
                children: _buildTabViews(), controller: tabController))
      ]);
    } else {
      tabBarView = Column(
        children: [
          TopNavBar(tabController: tabController),
          Expanded(
              child: TabBarView(
            children: _buildSmallTabViews(),
            controller: tabController,
          ))
        ],
      );
    }
    return Scaffold(
      body: SafeArea(top: !isDesktop, bottom: !isDesktop, child: tabBarView),
    );
  }

  List<Widget> _buildSmallTabViews() {
    return [
      SmallScreenHomePage(),
      Center(child: AboutMe()),
      Center(child: SmallProjectSection()),
      Center(
        child: SmallContactSection(),
      )
    ];
  }

  List<Widget> _buildTabViews() {
    return [
      LargeScreenHomePage(),
      Center(child: AboutMe()),
      Center(child: LargeProjectSection()),
      Center(child: LargeContactSection())
    ];
  }
}

ThemeData themeData(ThemeData base) {
  return base.copyWith(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
    primaryColor: Colors.blueGrey,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      clipBehavior: Clip.hardEdge
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      filled: true,
      fillColor: Colors.grey[200],
    ),
    tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[600],
        indicator: BoxDecoration(color: Colors.blueGrey)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      primary: base.canvasColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    )),
    iconTheme: IconThemeData(color: Colors.grey[600])
  );
}

bool _isLargeScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 1024.0;
}

class UnknownRoute extends StatelessWidget {
  const UnknownRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('404: Page not found'),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                page,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
                          .animate(animation),
                  child: child,
                ));
}

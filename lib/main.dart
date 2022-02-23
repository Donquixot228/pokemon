import 'package:flutter/material.dart';
import 'package:pokemon/pages/home_page.dart';
import 'package:pokemon/services/locator.dart';
import 'package:pokemon/services/navigation_service.dart';

import 'routes/app_router.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: Navigator(
          key: locator<NavigationService>().navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomePage.routeName,
        ),
      ),
    );
  }
}

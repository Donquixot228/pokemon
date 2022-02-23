import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/pokemo_bloc.dart';
import 'package:pokemon/pages/home_page.dart';
import 'package:pokemon/services/locator.dart';
import 'package:pokemon/services/navigation_service.dart';

import 'routes/app_router.dart';

void main() {
  setupLocator();
  runApp(
    BlocProvider(
      create: (context) => PokemonBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
        ),
      ),
      home: Scaffold(
        body: Navigator(
          key: locator<NavigationService>().navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomePage.routeName,
        ),
      ),
    );
  }
}

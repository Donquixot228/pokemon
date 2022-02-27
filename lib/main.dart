import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/pokemo_bloc.dart';
import 'package:pokemon/pages/home_page.dart';
import 'package:pokemon/resources/app_colors.dart';
import 'package:pokemon/services/locator.dart';
import 'package:pokemon/services/navigation_service.dart';

import 'resources/app_theme.dart';
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
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: Scaffold(
        backgroundColor: AppColors.purpleColor,
        body: Navigator(
          key: locator<NavigationService>().navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomePage.routeName,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokemon/pages/random_pokemon_page.dart';
import 'package:pokemon/pages/search_page.dart';
import 'package:pokemon/resources/app_colors.dart';
import 'package:pokemon/services/locator.dart';
import 'package:pokemon/services/navigation_service.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  static const String routeName = '/homePage';

  static Widget create() {
    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset('assets/images/Pan.gif'),
          ),
          HomeButton(
            numbOfButton: 1,
            text: 'Найти случайного \nпокемона',
          ),
          HomeButton(
            numbOfButton: 2,
            text: "Поиск покемона \nпо имени или номеру",
          ),
        ],
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final int numbOfButton;
  final String text;

  const HomeButton({
    required this.numbOfButton,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        numbOfButton == 1
            ? locator<NavigationService>()
                .navigateTo(RandomPokemonPage.routeName)
            : locator<NavigationService>().navigateTo(SearchPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black.withOpacity(0.6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Image.asset('assets/images/pokeLoad.gif'),
            ],
          ),
        ),
      ),
    );
  }
}

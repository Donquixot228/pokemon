import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pokemon/blocs/pokemo_bloc.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/resources/app_colors.dart';
import 'package:pokemon/widgets/poke_about.dart';
import 'package:pokemon/widgets/poke_moves.dart';
import 'package:pokemon/widgets/poke_stats.dart';
import 'package:pokemon/widgets/request_error.dart';
import 'package:pokemon/widgets/type_card.dart';

class PokeDetailScreen extends StatelessWidget {
  static const routeName = '/pokeDetailScreen';


  static Widget create() {
    return PokeDetailScreen();
  }

  int _selectedIndex = 0;
  var _isInit = true;

  Widget _buttonBuilder(Pokemon pokeData, String title, int myIndex) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _selectedIndex == myIndex
              ? setTypeColor(pokeData.type1)
              : Colors.transparent,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: _selectedIndex == myIndex
                    ? Colors.white
                    : setTypeColor(pokeData.type1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        return state.isLoading
            ? Center(child: Image.asset('assets/images/pokeLoad.gif'))
            : state.isRequestError
                ? RequestError()
                : Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 2,
                        color: state.isLoading
                            ? Colors.white
                            : setCardColor(state.pokemon.type1),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 4.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 35,
                            bottom: -50,
                            left: 35,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/pokeLoad.gif',
                              image: state.pokemon.sprite,
                              imageScale: 0.35,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${state.pokemon.name}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 35,
                                ),
                              ),
                              Text(
                                '#' + state.pokemon.id.toString(),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w800),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    TypeCard(state.pokemon.type1),
                                    SizedBox(width: 10),
                                    TypeCard(state.pokemon.type2),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 25,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: FittedBox(
                                  child: Text(
                                    state.pokemon.description,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buttonBuilder(state.pokemon, 'ABOUT', 0),
                                  _buttonBuilder(state.pokemon, 'STATS', 1),
                                  _buttonBuilder(state.pokemon, 'MOVES', 2),
                                ],
                              ),
                              _selectedIndex == 0
                                  ? Expanded(
                                      child: PokeAbout(state.pokemon),
                                    )
                                  : _selectedIndex == 1
                                      ? PokeStats(state.pokemon)
                                      : Expanded(
                                          child: PokeMoves(state.pokemon),
                                        )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
      },
    );
  }
}

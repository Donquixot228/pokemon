import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/pokemo_bloc.dart';
import 'package:pokemon/resources/app_colors.dart';
import 'package:pokemon/widgets/request_error.dart';

class RandomPokemonPage extends StatelessWidget {
  const RandomPokemonPage();

  static const String routeName = '/randomPokemonPage';

  static Widget create() {
    return const RandomPokemonPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
      return Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15),
              height: MediaQuery.of(context).size.width / 1.5,
              width: MediaQuery.of(context).size.width,
              child: HomeSearch(),
            ),
            Expanded(
              child: state.isLoading
                  ? Center(child: Image.asset('images/pokeLoad.gif'))
                  : RefreshIndicator(
                      onRefresh: () async {
                        context.read<PokemonBloc>().add(GetRandomPokemonData());
                      },
                      child: ListView(
                        padding: EdgeInsets.only(top: 20),
                        children: [
                          Column(
                            children: pokeData
                                .map((item) => PokeCard(item, context))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      );
    });
  }
}

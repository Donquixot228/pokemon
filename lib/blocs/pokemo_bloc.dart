import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/models/card_model.dart';
import 'package:pokemon/models/pokemon_model.dart';

part 'pokemo_event.dart';

part 'pokemo_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonState.initial()) {
    on<GetRandomPokemonData>((event, emit) async {
      int pokeNumber = 5;
      List<CardModel> tempList = [];
      emit(state.copyWith(isRequestError: false));
      for (int index = 1; index < pokeNumber + 1; index++) {
        int pokeIndex;
        Random rnd;
        int min = 1;
        int max = 893;
        rnd = new Random();
        pokeIndex = min + rnd.nextInt(max - min);
        try {
          emit(state.copyWith(isLoading: true));
          Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokeIndex');
          final response = await http.get(url);
          final responseData =
              json.decode(response.body) as Map<String, dynamic>;
          tempList.add(CardModel.fromJson(responseData));
        } catch (e) {
          throw (e);
        }
      }
      if (tempList.length == pokeNumber) {
        emit(state.copyWith(
          pokeList: tempList,
          isLoading: false,
        ));
        inspect(state.pokeList);
      }
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/models/card_model.dart';
import 'package:pokemon/models/pokemon_model.dart';

part 'pokemo_event.dart';
part 'pokemo_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonState.initial()) {
    on<PokemonEvent>((event, emit) {

    });
  }
}

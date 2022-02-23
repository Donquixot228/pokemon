import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pokemo_event.dart';
part 'pokemo_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonState()) {
    on<PokemonEvent>((event, emit) {

    });
  }
}

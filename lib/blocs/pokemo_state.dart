part of 'pokemo_bloc.dart';

class PokemonState {
  final bool isLoading;
  final bool isRequestError;
  final List<Pokemon> descList;
  final List<CardModel> pokeList;

  PokemonState({
    required this.isLoading,
    required this.isRequestError,
    required this.descList,
    required this.pokeList,
  });

  factory PokemonState.initial() {
    return PokemonState(
      isLoading: false,
      isRequestError: false,
      descList: [],
      pokeList: [],
    );
  }

  PokemonState copyWith({
    bool? isLoading,
    bool? isRequestError,
    List<CardModel>? pokeList,
    List<Pokemon>? descList,
  }) {
    return PokemonState(
      isLoading: isLoading ?? this.isLoading,
      isRequestError: isRequestError ?? this.isRequestError,
      pokeList: pokeList ?? this.pokeList,
      descList: descList ?? this.descList,
    );
  }
}

part of 'pokemo_bloc.dart';

class PokemonState {
  final bool isLoading;
  final bool isRequestError;
  final List<Pokemon> descList;
  final List<CardModel> pokeList;
  final Pokemon pokemon;

  PokemonState({
    required this.isLoading,
    required this.isRequestError,
    required this.descList,
    required this.pokeList,
    required this.pokemon,
  });

  factory PokemonState.initial() {
    return PokemonState(
      isLoading: false,
      isRequestError: false,
      descList: [],
      pokeList: [],
      pokemon: Pokemon(),
    );
  }

  PokemonState copyWith({
    bool? isLoading,
    bool? isRequestError,
    List<CardModel>? pokeList,
    List<Pokemon>? descList,
    Pokemon? pokemon,
  }) {
    return PokemonState(
      pokemon: pokemon ?? this.pokemon,
      isLoading: isLoading ?? this.isLoading,
      isRequestError: isRequestError ?? this.isRequestError,
      pokeList: pokeList ?? this.pokeList,
      descList: descList ?? this.descList,
    );
  }
}

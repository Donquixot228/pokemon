part of 'pokemo_bloc.dart';

 class PokemonState {

final bool isLoading;
final bool isRequesError;
final List<Pokemon> descList;
final List<CardModel> pokeList;


const PokemonState({
 required this.isLoading,
 required this.isRequesError,
 required this.descList,
 required this.pokeList,
 });

factory PokemonState.initial() {
 return PokemonState(
  isLoading: false,
  isRequesError: false,
  descList: [],
  pokeList:[],
 );
}





 }



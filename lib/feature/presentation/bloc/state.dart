import 'package:flutter_pokemon_application_test/feature/data/models/pokemon.dart';

abstract class PokemonState {
  String errorText = 'Network error. Try again!';
}

class PokemonEmptyState extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonLoadingMoreState extends PokemonState {}

class PokemonLoadedState extends PokemonState {}

class PokemonErrorState extends PokemonState {}

class DetailedLoadingState extends PokemonState {}

class DetailedLoadedState extends PokemonState {
  Pokemon pokemon;
  DetailedLoadedState({required this.pokemon});
}

class DetailedErrorState extends PokemonState {}

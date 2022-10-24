import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon_application_test/Model/1.pokemon.dart';

abstract class PokemonState {}

class PokemonEmptyState extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonLoadedState extends PokemonState {}

class PokemonErrorState extends PokemonState {}

class DetailedLoadingState extends PokemonState {}

class DetailedLoadedState extends PokemonState {
  Pokemon pokemon;
  DetailedLoadedState({required this.pokemon});
}

class DetailedErrorState extends PokemonState {}

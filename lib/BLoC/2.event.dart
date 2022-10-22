import 'package:flutter_pokemon_application_test/Model/1.pokemon.dart';

abstract class PokemonEvent {}

class PokemonInitEvent extends PokemonEvent {}

class DetailedEvent extends PokemonEvent {
  late Pokemon pokemon;
  DetailedEvent({required this.pokemon});
}

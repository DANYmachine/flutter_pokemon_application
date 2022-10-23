import 'dart:developer';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_pokemon_application_test/Model/1.pokemon.dart';

import '../DI/1.dependencies.dart';
import '../Drift DB/app_db.dart';

class PokemonsRepository {
  List<Pokemon> pokemons = [];
  List<Pokemon> pokemonsDB = [];

  Future<List<Pokemon>> getPokemonsList() async {
    pokemonsDB = [];
    for (var pok in await dependency<AppDb>().getPokemonsListFromDB()) {
      var note = Pokemon(
        name: pok.name,
        url: pok.url,
      );
      pokemonsDB.add(note);
    }
    return pokemonsDB;
  }

  Future<void> addNewPokemon(Pokemon note) async {
    PokemonsEntityCompanion entity = PokemonsEntityCompanion(
      name: drift.Value(note.name.toString()),
      url: drift.Value(note.url.toString()),
    );
    var pok = Pokemon(
      name: note.name,
      url: note.url,
    );
    await dependency<AppDb>().insertLocalPokemon(entity);
    log(pok.toString());
    await getPokemonsList();
  }

  Future<void> deleteCity(int id) async {
    await dependency<AppDb>().deleteLocalPokemon(id);
    await getPokemonsList();
  }
}

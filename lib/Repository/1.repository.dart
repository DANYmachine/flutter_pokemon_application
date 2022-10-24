import 'dart:developer';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_pokemon_application_test/Helper/helper.dart';
import 'package:flutter_pokemon_application_test/Model/1.pokemon.dart';

import '../DI/1.dependencies.dart';
import '../Drift DB/app_db.dart';

class PokemonsRepository {
  List<Pokemon> pokemons = [];
  List<Pokemon> pokemonsDB = [];

  Future<List<Pokemon>> getPokemonsList() async {
    pokemons = [];
    for (var pok in await dependency<AppDb>().getPokemonsListFromDB()) {
      var note = Pokemon(
        name: pok.name,
        url: pok.url,
        logoUri: pok.logoUri,
      );
      pokemons.add(note);
    }
    return pokemons;
  }

  Future<void> addNewPokemon(Pokemon note) async {
    PokemonsEntityCompanion entity = PokemonsEntityCompanion(
      name: drift.Value(note.name.toString()),
      url: drift.Value(note.url.toString()),
      logoUrl: drift.Value(note.logoUri.toString()),
    );
    var pok = Pokemon(
      name: note.name,
      url: note.url,
      logoUri: note.logoUri,
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

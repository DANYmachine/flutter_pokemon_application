import 'dart:developer';
import 'package:flutter_pokemon_application_test/DI/1.dependencies.dart';
import 'package:flutter_pokemon_application_test/Model/1.pokemon.dart';
import 'package:flutter_pokemon_application_test/Repository/1.repository.dart';

import '../Helper/helper.dart';

class Provider {
  String _api = 'https://pokeapi.co/api/v2/pokemon';

  final _rep = dependency<PokemonsRepository>();

  Future getInfo() async {
    _rep.pokemons = await _rep.getPokemonsList();
    //_rep.pokemons = [];

    if (_rep.pokemons.isEmpty) {
      log('DB doesn' 't exist. Creating DB');
      final res = await dependency<Helper>().httpHelper(_api);

      for (var pk in res['results']) {
        String n = dependency<Helper>().firstToUpper(pk['name']);
        var res2 = await dependency<Helper>().httpHelper(pk['url']);
        var pok = Pokemon(
          name: n,
          url: pk['url'],
          logoUri: res2['sprites']['front_default'],
        );

        await _rep.addNewPokemon(pok);
        //_rep.pokemons.add(pok);
      }
    }

    /*for (var pk in _rep.pokemons) {
      log(pk.toString());
    }*/
  }

  Future getDetails(Pokemon pokemon) async {
    var res = await dependency<Helper>().httpHelper(pokemon.url!);
    pokemon.types = [];
    pokemon.height = res['height'];
    pokemon.weight = res['weight'];

    for (var tp in res['types']) {
      String n = dependency<Helper>().firstToUpper(tp['type']['name']);

      pokemon.types.add(n);
      log(pokemon.types.length.toString());
    }

    pokemon.imgUri = res['sprites']['other']['dream_world']['front_default'];
    log(pokemon.imgUri.toString());
  }
}

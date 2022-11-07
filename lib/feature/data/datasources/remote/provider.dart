import 'dart:developer';
import 'package:flutter_pokemon_application_test/locator_service.dart';
import 'package:flutter_pokemon_application_test/feature/data/models/pokemon.dart';
import 'package:flutter_pokemon_application_test/feature/data/repositories/pokemon_repository.dart';

import '../../../../common/helper.dart';

class Provider {
  String _api = 'https://pokeapi.co/api/v2/pokemon';

  final _rep = sl<PokemonsRepository>();

  Future getInfo(String api) async {
    //_rep.pokemons = await _rep.getPokemonsList();
    //_rep.pokemons = [];

    /*if (_rep.pokemons.isEmpty) {
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

        //await _rep.addNewPokemon(pok);
        _rep.pokemons.add(pok);
      }
    }*/

    final res = await sl<Helper>().httpHelper(api);

    for (var pk in res['results']) {
      String n = sl<Helper>().firstToUpper(pk['name']);
      var res2 = await sl<Helper>().httpHelper(pk['url']);
      var pok = Pokemon(
        name: n,
        url: pk['url'],
        logoUri: res2['sprites']['front_default'],
      );

      //await _rep.addNewPokemon(pok);
      _rep.pokemons.add(pok);
    }

    /*for (var pk in _rep.pokemons) {
      log(pk.toString());
    }*/
  }

  Future loadNext() async {
    String bufApi = _api;
    var res = await sl<Helper>().httpHelper(bufApi);
    bufApi = res['next'];
    log(bufApi);
    res = await sl<Helper>().httpHelper(bufApi);
    _api = bufApi;
    await getInfo(bufApi);
  }

  Future getDetails(Pokemon pokemon) async {
    var res = await sl<Helper>().httpHelper(pokemon.url!);
    pokemon.types = [];
    pokemon.height = res['height'];
    pokemon.weight = res['weight'];

    for (var tp in res['types']) {
      String n = sl<Helper>().firstToUpper(tp['type']['name']);

      pokemon.types.add(n);
      log(pokemon.types.length.toString());
    }

    pokemon.imgUri = res['sprites']['other']['dream_world']['front_default'];
    log(pokemon.imgUri.toString());
  }
}

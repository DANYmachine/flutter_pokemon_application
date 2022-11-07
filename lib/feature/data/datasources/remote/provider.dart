import 'dart:developer';
import 'package:flutter_pokemon_application_test/locator_service.dart';
import 'package:flutter_pokemon_application_test/feature/data/models/pokemon.dart';
import 'package:flutter_pokemon_application_test/feature/data/repositories/pokemon_repository_impl.dart';

import '../../../../common/constants.dart';
import '../../../../common/helper.dart';
import '../local/app_db.dart';

class Provider {
  String _api = Constants().api;
  final _rep = sl<PokemonsRepository>();

  Future getInfo() async {
    var list = await sl<AppDb>().getPokemonsListFromDB();
    if (list.isNotEmpty) {
      _api = '$_api?offset=${list.length}&limit=20';
    }
    final res = await sl<Helper>().httpHelper(_api);

    for (var pk in res['results']) {
      String n = sl<Helper>().firstToUpper(pk['name']);
      var res2 = await sl<Helper>().httpHelper(pk['url']);
      var pok = Pokemon(
        name: n,
        url: pk['url'],
        logoUri: res2['sprites']['front_default'],
      );
      _rep.addNewPokemon(pok);
    }
  }

  /*Future loadNext() async {
    String bufApi = _api;
    var res = await sl<Helper>().httpHelper(bufApi);
    bufApi = res['next'];
    log(bufApi);
    res = await sl<Helper>().httpHelper(bufApi);
    _api = bufApi;
    await getInfo(bufApi);
  }*/

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

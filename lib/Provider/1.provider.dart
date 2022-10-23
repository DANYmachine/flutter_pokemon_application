import 'dart:developer';
import 'package:flutter_pokemon_application_test/DI/1.dependencies.dart';
import 'package:flutter_pokemon_application_test/Drift%20DB/app_db.dart';
import 'package:flutter_pokemon_application_test/Model/1.pokemon.dart';
import 'package:flutter_pokemon_application_test/Repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Provider {
  final String _api = 'https://pokeapi.co/api/v2/pokemon';

  final _rep = dependency<PokemonsRepository>();

  Future getInfo() async {
    _rep.pokemons = await _rep.getPokemonsList();

    if (_rep.pokemons.isEmpty) {
      log('DB doesn' 't exist. Creating DB');
      final url = Uri.parse(_api);
      http.Response response = await http.get(url);
      var res = jsonDecode(response.body);

      for (var pk in res['results']) {
        String n = pk['name'];
        String buffer = n.substring(0, 1);
        buffer = buffer.toUpperCase();
        n = n.replaceRange(0, 1, buffer);

        var pok = Pokemon(
          name: n,
          url: pk['url'],
        );
        _rep.addNewPokemon(pok);
      }
    }

    for (var pk in _rep.pokemons) {
      log(pk.toString());
    }
  }

  Future getDetails(Pokemon pokemon) async {
    final url = Uri.parse(pokemon.url!);
    http.Response response = await http.get(url);
    var res = jsonDecode(response.body);

    pokemon.height = res['height'];
    pokemon.weight = res['weight'];

    for (var tp in res['types']) {
      String n = tp['type']['name'];
      String buffer = n.substring(0, 1);
      buffer = buffer.toUpperCase();
      n = n.replaceRange(0, 1, buffer);

      pokemon.types.add(n);
    }

    pokemon.imgUri = res['sprites']['front_default'];
  }
}

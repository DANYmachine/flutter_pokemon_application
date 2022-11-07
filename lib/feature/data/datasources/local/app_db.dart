//flutter pub run build_runner build --delete-conflicting-outputs

import 'dart:developer';
import 'dart:io';
import 'package:flutter_pokemon_application_test/feature/data/models/pokemon.dart';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../../../domain/entities/entity.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'pokemons.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [PokemonsEntity])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<PokemonsEntityData>> getLocalPokemons() async {
    return await select(pokemonsEntity).get();
  }

  Future<List<Pokemon>> getPokemonsListFromDB() async {
    List<Pokemon> list = [];
    List<PokemonsEntityData> data = await select(pokemonsEntity).get();
    for (var note in data) {
      list.add(Pokemon(
        name: note.name,
        url: note.url,
        logoUri: note.logoUrl,
      ));
    }
    log('Count of DB pokemons: ${list.length}');
    return list;
  }

  Future<bool> updateLocalPokemon(PokemonsEntityCompanion entity) async {
    return await update(pokemonsEntity).replace(entity);
  }

  Future<int> insertLocalPokemon(PokemonsEntityCompanion entity) async {
    return await into(pokemonsEntity).insert(entity);
  }

  Future<int> deleteLocalPokemon(int id) async {
    return await (delete(pokemonsEntity)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .go();
  }
}

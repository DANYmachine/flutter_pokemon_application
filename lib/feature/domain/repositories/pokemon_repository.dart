import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_application_test/feature/data/models/pokemon.dart';

import '../../../core/error/failure.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<Pokemon>>> getAllPokemons(int page);
  Future<Either<Failure, List<Pokemon>>> searchPokemon(String query);
}

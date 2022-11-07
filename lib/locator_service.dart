import 'package:flutter_pokemon_application_test/feature/presentation/bloc/bloc.dart';
import 'package:flutter_pokemon_application_test/common/constants.dart';
import 'package:flutter_pokemon_application_test/common/helper.dart';
import 'package:flutter_pokemon_application_test/feature/data/datasources/remote/provider.dart';
import 'package:flutter_pokemon_application_test/feature/data/repositories/pokemon_repository.dart';
import 'package:get_it/get_it.dart';
import 'feature/data/datasources/local/app_db.dart';

final sl = GetIt.instance;

Future<void> initGetIt() async {
  sl.registerSingleton<PokemonsRepository>(PokemonsRepository());
  sl.registerSingleton<Provider>(Provider());
  sl.registerFactory<PokemonBloc>(() => PokemonBloc());
  sl.registerSingleton<AppDb>(AppDb());
  sl.registerSingleton<Constants>(Constants());
  sl.registerFactory<Helper>(() => Helper());
}

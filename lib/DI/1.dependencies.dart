import 'package:flutter_pokemon_application_test/BLoC/1.bloc.dart';
import 'package:flutter_pokemon_application_test/Constants/constants.dart';
import 'package:flutter_pokemon_application_test/Drift%20DB/app_db.dart';
import 'package:flutter_pokemon_application_test/Helper/helper.dart';
import 'package:flutter_pokemon_application_test/Provider/1.provider.dart';
import 'package:flutter_pokemon_application_test/Repository/1.repository.dart';
import 'package:get_it/get_it.dart';

final dependency = GetIt.instance;

void initGetIt() async {
  dependency.registerSingleton<PokemonsRepository>(PokemonsRepository());
  dependency.registerSingleton<Provider>(Provider());
  dependency.registerFactory<PokemonBloc>(() => PokemonBloc());
  dependency.registerSingleton<AppDb>(AppDb());
  dependency.registerSingleton<Constants>(Constants());
  dependency.registerFactory<Helper>(() => Helper());
}

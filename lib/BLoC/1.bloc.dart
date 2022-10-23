import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_application_test/Provider/1.provider.dart';
import '../DI/1.dependencies.dart';
import '2.event.dart';
import '3.state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Provider _provider = dependency.get<Provider>();

  PokemonBloc() : super(PokemonEmptyState()) {
    on<PokemonInitEvent>(((event, emit) async {
      emit(PokemonLoadingState());
      log(state.toString());
      try {
        await _provider.getInfo();
        emit(PokemonLoadedState());
      } catch (_) {
        emit(PokemonErrorState());
      }
    }));

    on<DetailedEvent>(((event, emit) async {
      emit(DetailedLoadingState());
      try {
        await _provider.getDetails(event.pokemon);
        emit(DetailedLoadedState(pokemon: event.pokemon));
      } catch (_) {
        emit(DetailedErrorState());
      }
    }));
  }
}

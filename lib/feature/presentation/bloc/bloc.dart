import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_application_test/common/constants.dart';
import 'package:flutter_pokemon_application_test/feature/data/datasources/remote/provider.dart';
import '../../../locator_service.dart';
import 'event.dart';
import 'state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Provider _provider = sl.get<Provider>();
  final Constants _const = sl.get<Constants>();

  PokemonBloc() : super(PokemonEmptyState()) {
    on<PokemonInitEvent>(((event, emit) async {
      emit(PokemonLoadingState());
      log(state.toString());
      try {
        await _provider.getInfo();
        emit(
          PokemonLoadedState(),
        );
      } catch (_) {
        emit(PokemonErrorState());
      }
    }));

    on<LoadMoreEvent>((event, emit) async {
      try {
        log('Loading more data');
        await _provider.getInfo();
        emit(
          PokemonLoadedState(),
        );
      } catch (_) {
        emit(PokemonErrorState());
      }
    });

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

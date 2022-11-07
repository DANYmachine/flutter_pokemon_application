import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_application_test/common/app_colors.dart';
import 'package:flutter_pokemon_application_test/feature/presentation/bloc/bloc.dart';
import 'package:flutter_pokemon_application_test/feature/presentation/bloc/event.dart';
import 'package:flutter_pokemon_application_test/locator_service.dart';
import 'package:flutter_pokemon_application_test/feature/data/repositories/pokemon_repository_impl.dart';
import '../Widgets/loading_indicator.dart';
import '../bloc/state.dart';
import '../Widgets/error_widget.dart';
import '../Widgets/pokemon_grid_widget.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late PokemonBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<PokemonBloc>(context);
    _bloc.add(PokemonInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF2196F3),
      appBar: AppBar(
        backgroundColor: AppColors.mainBackground,
        title: const Text('Pokemons'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoadingState) {
              return const LoadingWidget();
            }
            if (state is PokemonLoadedState) {
              return PokemonsGrid(list: sl<PokemonsRepository>().pokemons);
            }
            if (state is PokemonErrorState) {
              return NetworkErrorWidget(
                bloc: _bloc,
                event: PokemonInitEvent(),
              );
            }
            return const SizedBox(
              child: Center(
                child: Text('SizedBox'),
              ),
            );
          },
        ),
      ),
    );
  }
}

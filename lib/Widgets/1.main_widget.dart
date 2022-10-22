import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_application_test/BLoC/1.bloc.dart';
import 'package:flutter_pokemon_application_test/BLoC/2.event.dart';
import 'package:flutter_pokemon_application_test/DI/1.dependencies.dart';
import 'package:flutter_pokemon_application_test/Repository/repository.dart';
import 'package:flutter_pokemon_application_test/Widgets/2.detailed.dart';

import '../BLoC/3.state.dart';

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
      backgroundColor: const Color(0xFF2196F3),
      appBar: AppBar(
        title: const Text('Pokemons'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoadingState) {
              return const CircularProgressIndicator(
                color: Color.fromARGB(255, 250, 0, 146),
              );
            }
            if (state is PokemonLoadedState) {
              return ListView.builder(
                itemCount: dependency<PokemonsRepository>().pokemons.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            dependency<PokemonsRepository>()
                                .pokemons[index]
                                .name
                                .toString(),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => dependency<PokemonBloc>(),
                                  child: DetailedPage(
                                    pokemon: dependency<PokemonsRepository>()
                                        .pokemons[index],
                                  ),
                                ),
                              ),
                            ).then((value) => _bloc.add(PokemonInitEvent()));
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is PokemonErrorState) {
              return Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Network error. Try again!'),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        child: const Icon(
                          Icons.refresh,
                        ),
                        onPressed: () {
                          _bloc.add(PokemonInitEvent());
                        },
                      )
                    ],
                  ),
                ),
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

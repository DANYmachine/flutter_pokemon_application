import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoC/1.bloc.dart';
import '../BLoC/2.event.dart';
import '../DI/1.dependencies.dart';
import '../Model/1.pokemon.dart';
import '../Repository/1.repository.dart';
import 'detailed_page.dart';

class PokemonsGrid extends StatefulWidget {
  final List<Pokemon> list;
  const PokemonsGrid({super.key, required this.list});

  @override
  State<PokemonsGrid> createState() => _PokemonsGridState();
}

class _PokemonsGridState extends State<PokemonsGrid> {
  final itemKey = GlobalKey();
  late PokemonBloc _bloc;

  Future scrollToItem() async {
    final context = itemKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void didChangeDependencies() {
    _bloc = BlocProvider.of<PokemonBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: dependency<PokemonsRepository>().pokemons.length,
      itemBuilder: (context, index) {
        log(index.toString());
        if (index == dependency<PokemonsRepository>().pokemons.length - 1) {
          _bloc.add(LoadMoreEvent());
        }
        return Container(
          height: 150,
          padding: const EdgeInsets.all(15),
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => dependency<PokemonBloc>(),
                      child: DetailedPage(
                        pokemon:
                            dependency<PokemonsRepository>().pokemons[index],
                      ),
                    ),
                  ),
                ); //.then((value) => _bloc.add(PokemonInitEvent()));
              },
              child: GridTile(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                        '${dependency<PokemonsRepository>().pokemons[index].logoUri}'),
                    Text(
                      dependency<PokemonsRepository>()
                          .pokemons[index]
                          .name
                          .toString(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

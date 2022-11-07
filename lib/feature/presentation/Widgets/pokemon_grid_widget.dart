import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../../../locator_service.dart';
import '../../data/models/pokemon.dart';
import '../../data/repositories/pokemon_repository.dart';
import '../Pages/detailed_page.dart';

class PokemonsGrid extends StatefulWidget {
  final List<Pokemon> list;
  const PokemonsGrid({super.key, required this.list});

  @override
  State<PokemonsGrid> createState() => _PokemonsGridState();
}

class _PokemonsGridState extends State<PokemonsGrid> {
  late PokemonBloc _bloc;
  final _rep = sl.get<PokemonsRepository>();

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
      itemCount: _rep.pokemons.length,
      itemBuilder: (context, index) {
        log(index.toString());
        if (index == _rep.pokemons.length - 1) {
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
                      create: (_) => sl<PokemonBloc>(),
                      child: DetailedPage(
                        pokemon: _rep.pokemons[index],
                      ),
                    ),
                  ),
                );
              },
              child: GridTile(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network('${_rep.pokemons[index].logoUri}'),
                    Text(
                      _rep.pokemons[index].name.toString(),
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

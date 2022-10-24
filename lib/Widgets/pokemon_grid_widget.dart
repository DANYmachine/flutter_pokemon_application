import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoC/1.bloc.dart';
import '../BLoC/2.event.dart';
import '../DI/1.dependencies.dart';
import '../Repository/1.repository.dart';
import 'detailed_page.dart';

class PokemonsGrid extends StatefulWidget {
  const PokemonsGrid({super.key});

  @override
  State<PokemonsGrid> createState() => _PokemonsGridState();
}

class _PokemonsGridState extends State<PokemonsGrid> {
  late PokemonBloc _bloc;
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

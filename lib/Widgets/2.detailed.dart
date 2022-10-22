import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_application_test/BLoC/1.bloc.dart';
import 'package:flutter_pokemon_application_test/BLoC/2.event.dart';

import '../BLoC/3.state.dart';
import '../Model/1.pokemon.dart';

class DetailedPage extends StatefulWidget {
  final Pokemon pokemon;
  const DetailedPage({
    super.key,
    required this.pokemon,
  });

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  late PokemonBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<PokemonBloc>(context);
    _bloc.add(DetailedEvent(pokemon: widget.pokemon));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details about ${widget.pokemon.name}'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is DetailedLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DetailedLoadedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      '${state.pokemon.imgUri}',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text('Name:\t${state.pokemon.name}'),
                  Text('Height:\t${state.pokemon.height}\tcm'),
                  Text('Weight:\t${state.pokemon.weight}\tkg'),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Types:'),
                  Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: ListView.builder(
                      itemCount: state.pokemon.types.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text('${state.pokemon.types[index]}'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

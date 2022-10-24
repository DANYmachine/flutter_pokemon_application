import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_application_test/BLoC/1.bloc.dart';
import 'package:flutter_pokemon_application_test/BLoC/2.event.dart';
import 'package:flutter_pokemon_application_test/Widgets/detailed_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            return DetailedWidget(
              pokemon: widget.pokemon,
            );
          }
          if (state is DetailedErrorState) {
            return Center(
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
                      _bloc.add(DetailedEvent(pokemon: widget.pokemon));
                    },
                  )
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

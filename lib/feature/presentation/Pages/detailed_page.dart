import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_application_test/feature/presentation/Widgets/error_widget.dart';
import 'package:flutter_pokemon_application_test/feature/presentation/Widgets/loading_indicator.dart';
import 'package:flutter_pokemon_application_test/feature/presentation/bloc/bloc.dart';
import 'package:flutter_pokemon_application_test/feature/presentation/bloc/event.dart';
import 'package:flutter_pokemon_application_test/feature/presentation/Widgets/detailed_widget.dart';
import '../bloc/state.dart';
import '../../data/models/pokemon.dart';

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
            return const LoadingWidget();
          }
          if (state is DetailedLoadedState) {
            return DetailedWidget(pokemon: widget.pokemon);
          }
          if (state is DetailedErrorState) {
            return NetworkErrorWidget(
              bloc: _bloc,
              event: DetailedEvent(pokemon: widget.pokemon),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

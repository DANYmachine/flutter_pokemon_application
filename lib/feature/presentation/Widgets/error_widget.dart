import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';

class NetworkErrorWidget extends StatefulWidget {
  final PokemonBloc bloc;
  final PokemonEvent event;
  const NetworkErrorWidget({
    super.key,
    required this.bloc,
    required this.event,
  });

  @override
  State<NetworkErrorWidget> createState() => _NetworkErrorWidgetState();
}

class _NetworkErrorWidgetState extends State<NetworkErrorWidget> {
  @override
  Widget build(BuildContext context) {
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
              widget.bloc.add(widget.event);
            },
          )
        ],
      ),
    );
  }
}

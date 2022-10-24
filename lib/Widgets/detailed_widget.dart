import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../BLoC/1.bloc.dart';
import '../Model/1.pokemon.dart';

class DetailedWidget extends StatefulWidget {
  final Pokemon pokemon;
  const DetailedWidget({super.key, required this.pokemon});

  @override
  State<DetailedWidget> createState() => _DetailedWidgetState();
}

class _DetailedWidgetState extends State<DetailedWidget> {
  late PokemonBloc _bloc;
  @override
  void didChangeDependencies() {
    _bloc = BlocProvider.of<PokemonBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.all(15),
                height: 200,
                width: 200,
                child: SvgPicture.network('${widget.pokemon.imgUri}'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 15,
                color: Color.fromARGB(255, 255, 255, 135),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Name:\t${widget.pokemon.name}',
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Height:\t${widget.pokemon.height}\tcm'),
                    Text('Weight:\t${widget.pokemon.weight}\tkg'),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Types:',
                      style: TextStyle(fontSize: 17),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 300,
                      child: ListView.builder(
                        itemCount: widget.pokemon.types.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    widget.pokemon.types[index],
                                    style: const TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

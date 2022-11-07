import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/models/pokemon.dart';

class DetailedWidget extends StatefulWidget {
  final Pokemon pokemon;
  const DetailedWidget({super.key, required this.pokemon});

  @override
  State<DetailedWidget> createState() => _DetailedWidgetState();
}

class _DetailedWidgetState extends State<DetailedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 15,
        color: const Color.fromARGB(255, 255, 255, 135),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Material(
                elevation: 30,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 200,
                  width: 200,
                  child: SvgPicture.network('${widget.pokemon.imgUri}'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: 300,
                        child: Text(
                          'Name:\t${widget.pokemon.name}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: 200,
                        child: Column(children: [
                          Text('Height:\t${widget.pokemon.height}\tcm'),
                          Text('Weight:\t${widget.pokemon.weight}\tkg'),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Types:',
                      style: TextStyle(fontSize: 17),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 180,
                      child: ListView.builder(
                        itemCount: widget.pokemon.types.length,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Center(
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

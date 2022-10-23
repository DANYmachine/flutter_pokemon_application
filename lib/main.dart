import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_application_test/BLoC/1.bloc.dart';
import 'package:flutter_pokemon_application_test/DI/1.dependencies.dart';
import 'package:flutter_pokemon_application_test/Drift%20DB/app_db.dart';
import 'package:flutter_pokemon_application_test/Repository/repository.dart';

import 'Widgets/1.main_widget.dart';

void main() async {
  InitGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => dependency<PokemonBloc>(),
        child: const MainHomePage(),
      ),
    );
  }
}

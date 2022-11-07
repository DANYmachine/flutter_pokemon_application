import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_application_test/feature/presentation/bloc/bloc.dart';
import 'package:flutter_pokemon_application_test/locator_service.dart' as di;
import 'common/app_colors.dart';
import 'locator_service.dart';
import 'feature/presentation/Pages/main_home_page.dart';

void main() async {
  await di.initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: AppColors.mainBackground,
        scaffoldBackgroundColor: AppColors.cellBackground,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => sl<PokemonBloc>(),
        child: const MainHomePage(),
      ),
    );
  }
}

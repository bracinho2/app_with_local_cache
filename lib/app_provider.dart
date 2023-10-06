import 'package:app_with_local_cache/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/pokemon/pokemon_provider.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...pokemonProvider,
      ],
      child: const MyApp(),
    );
  }
}

import 'package:app_with_local_cache/app_widget.dart';
import 'package:app_with_local_cache/core/services/local_storage/local_storage.dart';
import 'package:app_with_local_cache/core/services/local_storage/local_storage_shared_preferences.dart';
import 'package:app_with_local_cache/modules/data/datasource/pokemon_datasource.dart';
import 'package:app_with_local_cache/modules/data/repository/pokemon_repository_impl.dart';
import 'package:app_with_local_cache/modules/domain/interfaces/repository/pokemon_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/decorator/pokemon_repository_decorator.dart';
import 'modules/data/endpoint/get_pokemons_datasource.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocalStorage>(
            create: (_) => const LocalStorageSharedPreferences()),
        Provider<PokemonDatasource>(create: (_) => GetPokemonsDatasource()),
        Provider<PokemonRepository>(
            create: (_) => PokemonRepositoryImpl(context.read())),
        ...providers,
      ],
      child: const MyApp(),
    );
  }
}

//teste de spread operator para separar injeções;
final providers = [
  Provider<PokemonRepositoryDecorator>(
      create: (context) =>
          PokemonCacheRepositoryDecorator(context.read(), context.read())),
];

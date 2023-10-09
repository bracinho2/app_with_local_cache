import 'package:app_with_local_cache/core/services/remote_storage/api_remote_storage.dart';
import 'package:app_with_local_cache/core/services/remote_storage/api_remote_storage_dio.dart';
import 'package:app_with_local_cache/modules/presenter/store/pokemon_store.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import 'data/datasource/pokemon_datasource.dart';
import 'data/endpoint/get_pokemons_datasource.dart';
import 'data/repository/pokemon_repository_impl.dart';
import 'domain/interfaces/repository/pokemon_repository.dart';
import 'domain/interfaces/usecase/get_pokemons_usecase.dart';
import 'domain/usecases/get_pokemons.dart';

final pokemonProvider = [
  Provider<Dio>(
    create: (context) => Dio(),
  ),
  Provider<ApiRemoteStorage>(
    create: (context) => ApiRemoteStorageDio(context.read()),
  ),
  Provider<PokemonDatasource>(
    create: (context) => GetPokemonEndpoint(context.read()),
  ),
  Provider<PokemonRepository>(
    create: (context) => PokemonRepositoryImpl(
      context.read(),
    ),
  ),
  Provider<GetPokemonsUsecase>(
    create: (context) => GetPokemons(
      context.read(),
    ),
  ),
  ChangeNotifierProvider<PokemonStore>(
    create: (context) => PokemonStore(context.read()),
  ),
];

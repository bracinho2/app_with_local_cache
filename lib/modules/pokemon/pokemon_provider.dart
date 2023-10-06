import 'package:app_with_local_cache/modules/presenter/store/pokemon_store.dart';
import 'package:provider/provider.dart';

final pokemonProvider = [
  // Provider<PokemonDatasource>(
  //   create: (_) => GetPokemonEndpoint(),
  // ),
  // Provider<PokemonRepository>(
  //   create: (context) => PokemonRepositoryImpl(
  //     context.read(),
  //   ),
  // ),
  // Provider<GetPokemonsUsecase>(
  //   create: (context) => GetPokemons(
  //     context.read(),
  //   ),
  // ),
  ChangeNotifierProvider<PokemonStore>(
    create: (_) => PokemonStore(),
  ),
];

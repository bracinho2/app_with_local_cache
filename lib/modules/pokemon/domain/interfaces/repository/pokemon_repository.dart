import 'package:app_with_local_cache/modules/pokemon/core/typedef/typedef.dart';

abstract class PokemonRepository {
  Future<GetPokemonResult> getPokemons();
}

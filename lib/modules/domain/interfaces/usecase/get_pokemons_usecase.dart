import 'package:app_with_local_cache/modules/core/typedef/typedef.dart';

abstract class GetPokemonsUsecase {
  Future<GetPokemonResult> getPokemons();
}

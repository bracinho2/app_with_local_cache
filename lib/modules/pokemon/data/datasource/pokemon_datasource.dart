import 'package:app_with_local_cache/modules/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonDatasource {
  Future<List<PokemonEntity>> getPokemons();
}

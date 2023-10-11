import 'package:app_with_local_cache/modules/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:app_with_local_cache/modules/pokemon/data/mapper/pokemon_mapper.dart';

import 'package:app_with_local_cache/modules/pokemon/domain/entities/pokemon_entity.dart';

import '../../../../core/services/remote_storage/api_remote_storage.dart';
import '../../domain/errors/pokemon_error.dart';

class GetPokemonEndpoint implements PokemonDatasource {
  final ApiRemoteStorage _apiRemoteStorage;
  GetPokemonEndpoint(this._apiRemoteStorage);
  @override
  Future<List<PokemonEntity>> getPokemons() async {
    try {
      final response =
          await _apiRemoteStorage.get(path: '/pokemon?limit=10&offset=200');

      if (response.statusCode == 200 &&
          (response.data['results'] as List).isNotEmpty) {
        return PokemonEntityMapper.fromMapList(json: response.data['results']);
      }
      return [];
    } catch (e) {
      //log(e.toString());
      //log(StackTrace.current.toString());
      throw PokemonDatasourceError();
    }
  }
}

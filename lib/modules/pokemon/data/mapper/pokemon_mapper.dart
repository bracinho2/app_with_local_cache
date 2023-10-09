import 'package:app_with_local_cache/modules/pokemon/domain/entities/pokemon_entity.dart';

class PokemonEntityMapper {
  static List<PokemonEntity> fromMapList({required dynamic json}) {
    return (json as List)
        .map((e) => PokemonEntityMapper.fromMap(map: e))
        .toList();
  }

  static PokemonEntity fromMap({required Map<String, dynamic> map}) {
    return PokemonEntity(
      url: map['url'],
      name: map['name'],
    );
  }

  static Map<String, dynamic> toMap({required PokemonEntity entity}) {
    return {
      'url': entity.url,
      'name': entity.name,
    };
  }
}

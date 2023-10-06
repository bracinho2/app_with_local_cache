import 'package:app_with_local_cache/modules/pokemon/domain/entities/pokemon_entity.dart';

class PokemonEntityMapper {
  static PokemonEntity fromMap({required Map<String, dynamic> map}) {
    return PokemonEntity(
      uid: map['uid'],
      name: map['name'],
    );
  }

  static Map<String, dynamic> toMap({required PokemonEntity entity}) {
    return {
      'uid': entity.uid,
      'name': entity.name,
    };
  }
}

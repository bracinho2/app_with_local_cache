import 'package:app_with_local_cache/modules/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:app_with_local_cache/modules/pokemon/data/mapper/pokemon_mapper.dart';
import 'package:app_with_local_cache/modules/pokemon/domain/entities/pokemon_entity.dart';

class GetPokemonEndpoint implements PokemonDatasource {
  @override
  Future<List<PokemonEntity>> getPokemons() async {
    final pokemons = pokemonsMock
        .map(
          (pokemon) => PokemonEntityMapper.fromMap(
            map: pokemon,
          ),
        )
        .toList();
    return pokemons;
  }
}

const pokemonsMock = [
  {
    "uid": "abc",
    "name": "my poke",
  },
  {
    "uid": "yzd",
    "name": "my poke2",
  },
  {
    "uid": "tyu",
    "name": "my poke3",
  },
];

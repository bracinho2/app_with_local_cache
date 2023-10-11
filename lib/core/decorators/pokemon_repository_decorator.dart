import 'dart:convert';
import 'package:app_with_local_cache/modules/pokemon/core/typedef/typedef.dart';
import 'package:app_with_local_cache/modules/pokemon/data/mapper/pokemon_mapper.dart';
import 'package:app_with_local_cache/modules/pokemon/domain/entities/pokemon_entity.dart';
import 'package:app_with_local_cache/modules/pokemon/domain/interfaces/repository/pokemon_repository.dart';
import 'package:dartz/dartz.dart';

import '../services/local_storage/local_storage.dart';

class PokemonRepositoryDecorator implements PokemonRepository {
  final PokemonRepository _repository;

  PokemonRepositoryDecorator(this._repository);
  @override
  Future<GetPokemonResult> getPokemons() async {
    return await _repository.getPokemons();
  }
}

class PokemonCacheRepositoryDecorator extends PokemonRepositoryDecorator {
  final LocalStorage _localCache;

  PokemonCacheRepositoryDecorator(
    super.repository,
    this._localCache,
  );

  @override
  Future<GetPokemonResult> getPokemons() async {
    try {
      final result = await super.getPokemons();

      return result.map(_saveInCache);
    } catch (e) {
      return Right(await _getFromCache());
    }
  }

  String _entityToString(List<PokemonEntity> pokemons) {
    return jsonEncode(
      pokemons
          .map(
            (pokemon) => PokemonEntityMapper.toMap(
              entity: pokemon,
            ),
          )
          .toList(),
    );
  }

  List<PokemonEntity> _saveInCache(List<PokemonEntity> pokemons) {
    _localCache.save(
      key: 'pokemons',
      value: _entityToString(pokemons),
    );

    print('SALVOU NO CACHE: \n $pokemons');

    return pokemons;
  }

  Future<List<PokemonEntity>> _getFromCache() async {
    final result = jsonDecode(await _localCache.load(key: 'pokemons'));

    print('RECUPEROU DO CACHE: \n $result');

    return _stringToEntity(result);
  }

  //Vide Chain of Responsability
  List<PokemonEntity> _stringToEntity(dynamic result) {
    return (result as List)
        .map(
          (map) => PokemonEntityMapper.fromMap(map: map),
        )
        .toList();
  }
}

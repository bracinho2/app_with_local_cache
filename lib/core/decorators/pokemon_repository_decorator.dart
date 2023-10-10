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
      result.fold(
        (l) => null,
        (success) => _saveInCache(success),
      );
      return result;
    } catch (e) {
      return Right(await _getFromCache());
    }
  }

  _saveInCache(List<PokemonEntity> pokemons) {
    final jsonPokemons = jsonEncode(pokemons
        .map(
          (pokemon) => PokemonEntityMapper.toMap(
            entity: pokemon,
          ),
        )
        .toList());

    _localCache.save(
      key: 'pokemons',
      value: jsonPokemons,
    );
    print('SALVOU NO CACHE: \n $pokemons');
  }

  Future<List<PokemonEntity>> _getFromCache() async {
    final result = jsonDecode(await _localCache.load(key: 'pokemons'));
    final pokemons = (result as List)
        .map(
          (map) => PokemonEntityMapper.fromMap(map: map),
        )
        .toList();
    print('RECUPEROU DO CACHE: \n $pokemons');
    return pokemons;
  }
}

// class MovieStore {
//   final MoviesRepository _repository;
//   MovieStore(this._repository);
// }

// final _controller = MovieStore(
//   MovieCacheRepositoryDecorator(
//     MovieRepositoryImpl(),
//     MyLocalCacheImpl(),
//   ),
// );



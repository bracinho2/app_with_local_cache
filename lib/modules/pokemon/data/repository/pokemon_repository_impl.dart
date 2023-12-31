import 'package:app_with_local_cache/modules/pokemon/core/typedef/typedef.dart';
import 'package:app_with_local_cache/modules/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../domain/interfaces/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource _datasource;

  PokemonRepositoryImpl(this._datasource);

  @override
  Future<GetPokemonResult> getPokemons() async {
    return Right(await _datasource.getPokemons());
  }
}

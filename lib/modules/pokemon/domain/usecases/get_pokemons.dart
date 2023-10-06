import 'package:app_with_local_cache/modules/pokemon/core/typedef/typedef.dart';
import 'package:app_with_local_cache/modules/pokemon/domain/interfaces/repository/pokemon_repository.dart';
import 'package:app_with_local_cache/modules/pokemon/domain/interfaces/usecase/get_pokemons_usecase.dart';

class GetPokemons implements GetPokemonsUsecase {
  final PokemonRepository _repository;

  GetPokemons(this._repository);
  @override
  Future<GetPokemonResult> getPokemons() async {
    return await _repository.getPokemons();
  }
}

import 'package:app_with_local_cache/modules/pokemon/domain/interfaces/usecase/get_pokemons_usecase.dart';
import 'package:flutter/material.dart';

import '../state/pokemon_state.dart';

class PokemonStore extends ValueNotifier<PokemonState> {
  PokemonStore(this._getPokemonsUsecase) : super(PokemonLoadingState());

  final GetPokemonsUsecase _getPokemonsUsecase;

  Future<void> init() async {
    await _getPokemons();
  }

  Future<void> _getPokemons() async {
    final result = await _getPokemonsUsecase.call();
    result.fold(
      (error) => null,
      (success) {
        value = PokemonSuccessState(
          pokemons: success,
        );
      },
    );
  }
}

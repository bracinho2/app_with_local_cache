import 'dart:async';

import 'package:app_with_local_cache/core/services/snackbar_manager/snackbar_manager.dart';
import 'package:app_with_local_cache/modules/pokemon/domain/interfaces/usecase/get_pokemons_usecase.dart';
import 'package:flutter/material.dart';

import '../../../core/services/check_connection/internet_connection_checker.dart';
import '../state/pokemon_state.dart';

class PokemonStore extends ValueNotifier<PokemonState> {
  PokemonStore(
    this._getPokemonsUsecase,
    this._snackBarManager,
    this._internetConnectionCheckerService,
  ) : super(PokemonLoadingState());

  final GetPokemonsUsecase _getPokemonsUsecase;
  final SnackBarManager _snackBarManager;

  final InternetConnectionCheckerService _internetConnectionCheckerService;

  Future<void> init() async {
    await _getPokemons();
  }

  Future<void> cancelCheckConnection() async {
    _internetConnectionCheckerService.cancelSubscription();
  }

  Future<void> checkConnection() async {
    final subscription =
        _internetConnectionCheckerService.getConnectionStatus();
    subscription.listen((event) => print(event));
  }

  Future<void> _getPokemons() async {
    final result = await _getPokemonsUsecase.call();
    result.fold(
      (error) => null,
      (success) {
        _snackBarManager.showSuccess(
          message: 'Baixado da API',
        );
        value = PokemonSuccessState(
          pokemons: success,
        );
      },
    );
  }
}

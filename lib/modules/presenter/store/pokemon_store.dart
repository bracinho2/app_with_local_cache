import 'package:flutter/material.dart';

import '../state/pokemon_state.dart';

class PokemonStore extends ValueNotifier<PokemonState> {
  PokemonStore() : super(PokemonLoadingState());

  Future<void> init() async {
    print('Pokemon Page Initialized =)');
  }
}

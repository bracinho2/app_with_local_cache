import 'package:app_with_local_cache/modules/presenter/state/pokemon_state.dart';
import 'package:app_with_local_cache/modules/presenter/store/pokemon_store.dart';
import 'package:flutter/material.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({
    super.key,
    required this.store,
  });

  final PokemonStore store;

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  PokemonStore get _store => widget.store;

  @override
  void initState() {
    super.initState();
    _store.checkConnection();
    _store.init();
  }

  @override
  void dispose() {
    _store.cancelCheckConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _store,
      builder: (context, state, _) {
        if (state is PokemonLoadingState) {
          return const Scaffold(
            body: Center(
              child: LinearProgressIndicator(),
            ),
          );
        }

        if (state is PokemonSuccessState) {
          final pokemons = state.pokemons;
          return Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {}),
            body: ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final item = pokemons[index];

                return ListTile(
                  title: Text(item.name),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

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
    _store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Pokemon Page',
        ),
      ),
    );
  }
}

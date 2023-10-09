import 'package:app_with_local_cache/modules/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonSuccessState extends PokemonState {
  final List<PokemonEntity> pokemons;
  PokemonSuccessState({
    required this.pokemons,
  });
}

class PokemonErrorState extends PokemonState {}

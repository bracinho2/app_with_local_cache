class PokemonEntity {
  PokemonEntity({
    required this.url,
    required this.name,
  });

  final String url;
  final String name;

  @override
  String toString() => 'PokemonEntity(uid: $url, name: $name)';
}

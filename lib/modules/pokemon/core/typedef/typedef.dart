import 'package:app_with_local_cache/modules/pokemon/domain/entities/pokemon_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/global_errors.dart';

typedef GetPokemonResult = Either<Failure, List<PokemonEntity>>;

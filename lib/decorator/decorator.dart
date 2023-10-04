class Movie {}

abstract class MoviesRepository {
  Future<Movie> getMovie();
}

class MovieRepositoryImpl implements MoviesRepository {
  @override
  Future<Movie> getMovie() async {
    final movie = Movie();
    return movie;
  }
}

class MovieRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _repository;

  MovieRepositoryDecorator(this._repository);
  @override
  Future<Movie> getMovie() async {
    return await _repository.getMovie();
  }
}

class MovieCacheRepositoryDecorator extends MovieRepositoryDecorator {
  final MyLocalCache _localCache;
  MovieCacheRepositoryDecorator(
    super.repository,
    this._localCache,
  );

  @override
  Future<Movie> getMovie() async {
    try {
      final movie = await super.getMovie();
      _saveInCache(movie);
      return movie;
    } catch (e) {
      return _getFromCache();
    }
  }

  _saveInCache(Movie movie) {
    _localCache.saveInCache(movie: movie);
    print('salvou $movie no cache');
  }

  Movie _getFromCache() {
    final result = _localCache.getFromCache();
    print('recuperou do cache $result');
    return result;
  }
}

class MovieStore {
  final MoviesRepository _repository;
  MovieStore(this._repository);
}

final _controller = MovieStore(
  MovieCacheRepositoryDecorator(
    MovieRepositoryImpl(),
    MyLocalCacheImpl(),
  ),
);

abstract class MyLocalCache {
  saveInCache({required Movie movie});
  Movie getFromCache();
}

class MyLocalCacheImpl implements MyLocalCache {
  @override
  Movie getFromCache() {
    // TODO: implement getFromCache
    throw UnimplementedError();
  }

  @override
  saveInCache({required Movie movie}) {
    // TODO: implement saveInCache
    throw UnimplementedError();
  }
}

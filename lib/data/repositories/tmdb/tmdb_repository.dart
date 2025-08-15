import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/domain/models/movie.dart';

abstract interface class TmdbRepository {
  Future<Result<List<Movie>>> getPopularMovies({String language, int page});
}

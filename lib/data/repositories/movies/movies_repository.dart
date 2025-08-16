import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';

abstract interface class MoviesRepository {
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies();
  Future<Result<Unit>> deleteFavoriteMovies(int movieId);
  Future<Result<Unit>> saveFavoriteMovie(FavoriteMovie favoriteMovie);
}

import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/models/save_favorite_movie.dart';
import 'package:cinebox/data/services/movies/movies_service.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:dio/dio.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesService _moviesService;

  MoviesRepositoryImpl({required MoviesService moviesService})
    : _moviesService = moviesService;

  @override
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies() async {
    try {
      final response = await _moviesService.getMyFavoritesMovies();
      final favorites = response
          .map(
            (f) => FavoriteMovie(
              id: f.movieId,
              title: f.title,
              posterPath: f.posterUrl,
              year: f.year,
            ),
          )
          .toList();
      return Success(favorites);
    } on DioException catch (err, stackTrace) {
      log(
        'Erro ao buscar filmes favoritos',
        name: 'MoviesRepository',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(
        DataException(message: 'Failed to fetch favorite movies'),
        stackTrace,
      );
    }
  }

  @override
  Future<Result<Unit>> deleteFavoriteMovies(int movieId) async {
    try {
      await _moviesService.deleteFavoriteMovies(movieId);
      return successOfUnit();
    } on DioException catch (err, stackTrace) {
      log(
        'Error on deleting favorite movie',
        name: 'MoviesRepository',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(
        DataException(message: 'Failed to delete favorite movie'),
      );
    }
  }

  @override
  Future<Result<Unit>> saveFavoriteMovie(FavoriteMovie favoriteMovie) async {
    try {
      await _moviesService.saveFavoriteMovie(
        SaveFavoriteMovie(
          movieId: favoriteMovie.id,
          posterUrl: favoriteMovie.posterPath,
          title: favoriteMovie.title,
          year: favoriteMovie.year,
        ),
      );
      return successOfUnit();
    } on DioException catch (err, stackTrace) {
      log(
        'Error on saving favorite movie',
        name: 'MoviesRepository',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(DataException(message: 'Failed to save favorite movie'));
    }
  }
}

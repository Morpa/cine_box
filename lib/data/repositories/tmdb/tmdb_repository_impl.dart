import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/mappers/movie_mappers.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox/domain/models/genre.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:dio/dio.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({
    required TmdbService tmdbService,
  }) : _tmdbService = tmdbService;

  @override
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (err, stackTrace) {
      log(
        'Error on fetching getPopularMovies',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(
        DataException(message: 'Error on fetching popular movies'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getNowPlayingMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (err, stackTrace) {
      log(
        'Error on fetching getNowPlayingMovies',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(
        DataException(message: 'Error on fetching now playing movies'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (err, stackTrace) {
      log(
        'Error on fetching getTopRatedMovies',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(
        DataException(message: 'Error on fetching top rated movies'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getUpcomingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getUpComingMovies(
        language: language,
        page: page,
      );
      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (err, stackTrace) {
      log(
        'Error on fetching getUpcomingMovies',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(
        DataException(message: 'Error on fetching upcoming movies'),
      );
    }
  }

  @override
  Future<Result<List<Genre>>> getGenres({String language = 'pt-BR'}) async {
    try {
      final data = await _tmdbService.getMoviesGenres(language: language);
      final genres = data.genres
          .map((genre) => Genre(id: genre.id, name: genre.name))
          .toList();
      return Success(genres);
    } on DioException catch (err, stackTrace) {
      log(
        'Error on fetching getGenres',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(
        DataException(message: 'Error on fetching movie genres'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getMoviesByGenres({
    String language = 'pt-BR',
    required int genreId,
  }) async {
    try {
      final data = await _tmdbService.discoverMovies(
        language: language,
        withGenres: genreId.toString(),
      );
      return Success(MovieMappers.mapToMovies(data));
    } on DioException catch (err, stackTrace) {
      log(
        'Error on fetching getMoviesByGenres',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(
        DataException(message: 'Error on fetching movies by genre'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> searchMovies({
    String language = 'pt-BR',
    required String query,
  }) async {
    try {
      final data = await _tmdbService.searchMovies(
        language: language,
        query: query,
      );
      return Success(MovieMappers.mapToMovies(data));
    } on DioException catch (err, stackTrace) {
      log(
        'Error on fetching searchMovies',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(
        DataException(message: 'Error on fetching search movies'),
      );
    }
  }
}

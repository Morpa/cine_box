import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/mappers/movie_mappers.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
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
}

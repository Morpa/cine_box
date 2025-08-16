import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/mappers/movie_mappers.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox/domain/models/cast.dart';
import 'package:cinebox/domain/models/genre.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/models/movie_detail.dart';
import 'package:dio/dio.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({
    required TmdbService tmdbService,
  }) : _tmdbService = tmdbService;

  @override
  Future<Result<List<Movie>>> getPopularMovies({int page = 1}) async {
    try {
      final moviesData = await _tmdbService.getPopularMovies(page: page);
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
  Future<Result<List<Movie>>> getNowPlayingMovies({int page = 1}) async {
    try {
      final moviesData = await _tmdbService.getNowPlayingMovies(page: page);
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
  Future<Result<List<Movie>>> getTopRatedMovies({int page = 1}) async {
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(page: page);
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
  Future<Result<List<Movie>>> getUpcomingMovies({int page = 1}) async {
    try {
      final moviesData = await _tmdbService.getUpComingMovies(page: page);
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
  Future<Result<List<Genre>>> getGenres() async {
    try {
      final data = await _tmdbService.getMoviesGenres();
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
  Future<Result<List<Movie>>> getMoviesByGenres({required int genreId}) async {
    try {
      final data = await _tmdbService.discoverMovies(
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
  Future<Result<List<Movie>>> searchMovies({required String query}) async {
    try {
      final data = await _tmdbService.searchMovies(query: query);
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

  @override
  Future<Result<MovieDetail>> getMovieDetail({required int movieId}) async {
    try {
      final response = await _tmdbService.getMovieDetails(
        movieId,
        appendToResponse:
            'credits, videos,recommendations,release_dates,images',
      );

      final movieDetail = MovieDetail(
        title: response.title,
        overview: response.overview,
        releaseDate: response.releaseDate,
        runtime: response.runtime,
        voteAverage: response.voteAverage,
        voteCount: response.voteCount,
        images: response.images.backdrops
            .map((i) => 'https://image.tmdb.org/t/p/w342${i.filePath}')
            .toList(),
        cast: response.credits.cast
            .map(
              (c) => Cast(
                name: c.name,
                character: c.character,
                profilePath: c.profilePath,
              ),
            )
            .toList(),
        genres: response.genres
            .map((g) => Genre(id: g.id, name: g.name))
            .toList(),
        videos: response.videos.results.map((v) => v.key).toList(),
      );

      return Success(movieDetail);
    } on DioException catch (err, stackTrace) {
      log(
        'Error on fetching getMovieDetail',
        error: err,
        stackTrace: stackTrace,
      );
      return Failure(
        DataException(message: 'Error on fetching movie details'),
      );
    }
  }
}

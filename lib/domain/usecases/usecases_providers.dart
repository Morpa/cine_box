import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/domain/usecases/get_movies_by_category_usecase.dart';
import 'package:cinebox/domain/usecases/get_movies_by_genre_usecase.dart';
import 'package:cinebox/domain/usecases/get_movies_by_name_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecases_providers.g.dart';

@riverpod
GetMoviesByCategoryUsecase getMoviesByCategoryUsecase(Ref ref) =>
    GetMoviesByCategoryUsecase(
      tmdbRepository: ref.read(tmdbRepositoryProvider),
    );

@riverpod
GetMoviesByGenreUsecase getMoviesByGenreUsecase(Ref ref) =>
    GetMoviesByGenreUsecase(
      tmdbRepository: ref.read(tmdbRepositoryProvider),
    );

@riverpod
GetMoviesByNameUsecase searchMoviesUsecase(Ref ref) => GetMoviesByNameUsecase(
  tmdbRepository: ref.read(tmdbRepositoryProvider),
);

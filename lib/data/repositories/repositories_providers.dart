import 'package:cinebox/data/repositories/auth/auth_repository.dart';
import 'package:cinebox/data/repositories/auth/auth_repository_impl.dart';
import 'package:cinebox/data/repositories/movies/movies_repository.dart';
import 'package:cinebox/data/repositories/movies/movies_repository_impl.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository_impl.dart';
import 'package:cinebox/data/services/services_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(
  localStorageService: ref.read(localStorageServiceProvider),
  googleSigninService: ref.read(googleSigninServiceProvider),
  authService: ref.read(authServiceProvider),
);

@riverpod
TmdbRepository tmdbRepository(Ref ref) => TmdbRepositoryImpl(
  tmdbService: ref.read(tmdbServiceProvider),
);

@riverpod
MoviesRepository moviesRepository(Ref ref) => MoviesRepositoryImpl(
  moviesService: ref.read(moviesServiceProvider),
);

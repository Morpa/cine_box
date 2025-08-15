import 'package:cinebox/ui/movies/commands/get_movies_by_genre_command.dart';
import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByGender extends ConsumerWidget {
  const MoviesByGender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchMovies = ref.watch(getMoviesByGenreCommandProvider);

    return searchMovies.when(
      loading: () => const Center(
        child: CircularProgressIndicator(strokeWidth: 1),
      ),
      error: (error, stackTrace) =>
          const Center(child: Text('Erro ao carregar filmes por gênero')),
      data: (data) {
        return Container(
          margin: const EdgeInsets.only(bottom: 130),
          child: MoviesBox(
            title: 'Filmes encontrados',
            vertical: true,
            movies: data,
          ),
        );
      },
    );
  }
}

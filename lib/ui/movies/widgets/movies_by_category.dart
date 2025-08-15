import 'package:cinebox/ui/movies/commands/get_movies_by_category_command.dart';
import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByCategory extends ConsumerWidget {
  const MoviesByCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(getMoviesByCategoryCommandProvider);

    return movies.when(
      loading: () => Padding(
        padding: const EdgeInsets.all(20),
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 1,
          ),
        ),
      ),
      error: (error, stackTrace) => Padding(
        padding: const EdgeInsets.all(20),
        child: const Center(child: Text('Error ao carregar filmes')),
      ),
      data: (data) {
        if (data == null) {
          return const Center(child: Text('Nenhum filme encontrado'));
        }
        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: Column(
            children: [
              MoviesBox(title: 'Mais populares', movies: data.popular),
              MoviesBox(title: 'Melhores avaliados', movies: data.topRated),
              MoviesBox(title: 'Em cartaz', movies: data.nowPlaying),
              MoviesBox(title: 'Em breve', movies: data.nowPlaying),
            ],
          ),
        );
      },
    );
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_view_model.g.dart';

enum MoviesViewEnum { byCategory, byGenre, bySearch }

@riverpod
class MoviesViewModel extends _$MoviesViewModel {
  @override
  MoviesViewEnum build() => MoviesViewEnum.byCategory;

  Future<void> changeView(MoviesViewEnum view) async {
    state = view;
    await Future.delayed(const Duration(milliseconds: 200));
  }
}

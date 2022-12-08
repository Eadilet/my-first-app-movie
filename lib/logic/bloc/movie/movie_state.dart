part of 'movie_bloc.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieSuccess extends MovieState {
  final List<Movie> movies;
  final bool hasReachedMax;

  MovieSuccess({required this.movies, required this.hasReachedMax});

  MovieSuccess copyWith({
    List<Movie>? movies,
    bool? hasReachedMax,
  }) {
    return MovieSuccess(
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class MovieFailed extends MovieState {}

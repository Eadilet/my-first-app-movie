part of 'search_movie_bloc.dart';

abstract class SearchMovieEvent {}

class FetchSearchingMovie extends SearchMovieEvent {
  final String movieName;

  FetchSearchingMovie({required this.movieName});
}

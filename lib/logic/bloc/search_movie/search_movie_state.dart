part of 'search_movie_bloc.dart';

abstract class SearchMovieState {}

class SearchMovieSearched extends SearchMovieState {
  final List<Movie> searchingMovies;
  final bool isLoading;

  SearchMovieSearched copyWith({
    List<Movie>? searchingMovies,
    bool? isLoading,
  }) {
    return SearchMovieSearched(
      searchingMovies: searchingMovies ?? this.searchingMovies,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  SearchMovieSearched({this.searchingMovies = const [], this.isLoading = true});
}

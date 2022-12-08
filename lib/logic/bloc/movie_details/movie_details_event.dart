part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent {}

class FetchingMovieDetails extends MovieDetailsEvent {
  final int id;

  FetchingMovieDetails({required this.id});
}

part of 'movie_details_bloc.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetails movie;

  MovieDetailsLoaded({required this.movie});
}

class MovieDetailsFailed extends MovieDetailsState {}

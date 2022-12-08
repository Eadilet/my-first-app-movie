part of 'upcoming_bloc.dart';

abstract class UpcomingState {}

class UpcomingInitial extends UpcomingState {}

class UpcomingSuccess extends UpcomingState {
  final List<Movie> upComingMovie;
  final bool hasReachedMax;

  UpcomingSuccess({required this.upComingMovie, required this.hasReachedMax});

  UpcomingSuccess copyWith({
    List<Movie>? upComingMovie,
    bool? hasReachedMax,
  }) {
    return UpcomingSuccess(
      upComingMovie: upComingMovie ?? this.upComingMovie,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class UpcomingFailed extends UpcomingState {}

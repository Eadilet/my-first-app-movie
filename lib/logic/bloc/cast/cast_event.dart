part of 'cast_bloc.dart';

@immutable
abstract class CastEvent {}

class FetchMovieCast extends CastEvent {
  final int movieId;

  FetchMovieCast({required this.movieId});
}

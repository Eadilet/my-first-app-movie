part of 'cast_bloc.dart';

@immutable
abstract class CastState {}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastLoaded extends CastState {
  final List<Cast> cast;

  CastLoaded({required this.cast});
}

class CastFailed extends CastState {}

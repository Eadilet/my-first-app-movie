part of 'people_bloc.dart';

abstract class PeopleState {}

class PeopleInitial extends PeopleState {}

class PeopleSuccess extends PeopleState {
  final List<Person> persons;
  final bool hasReachedMax;

  PeopleSuccess({required this.persons, required this.hasReachedMax});

  PeopleSuccess copyWith({List<Person>? persons, bool? hasReachedMax}) {
    return PeopleSuccess(
      persons: persons ?? this.persons,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class PeopleFailed extends PeopleState {}

part of 'people_details_bloc.dart';

@immutable
abstract class PeopleDetailsState {}

class PeopleDetailsInitial extends PeopleDetailsState {}

class PeopleDetailsLoading extends PeopleDetailsState {}

class PeopleDetailsFailed extends PeopleDetailsState {}

class PeopleDetailsLoaded extends PeopleDetailsState {
  final PeopleDetails peopleDetails;

  PeopleDetailsLoaded copyWith({
    bool? hasReachedMax,
    PeopleDetails? peopleDetails,
  }) {
    return PeopleDetailsLoaded(
        peopleDetails: peopleDetails ?? this.peopleDetails);
  }

  PeopleDetailsLoaded({
    required this.peopleDetails,
  });
}

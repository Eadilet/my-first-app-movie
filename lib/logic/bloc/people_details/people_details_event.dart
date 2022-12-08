part of 'people_details_bloc.dart';

abstract class PeopleDetailsEvent {}

class FetchPeopleDetails extends PeopleDetailsEvent {
  final int id;
  FetchPeopleDetails({required this.id});
}

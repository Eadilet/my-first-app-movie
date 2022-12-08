import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/model/people_details.dart';
import 'package:movie_app/data/repository/tdbmovie_repository.dart';

part 'people_details_event.dart';
part 'people_details_state.dart';

class PeopleDetailsBloc extends Bloc<PeopleDetailsEvent, PeopleDetailsState> {
  final MovieRepository movieRepository;
  PeopleDetailsBloc({required this.movieRepository})
      : super(PeopleDetailsInitial()) {
    on<FetchPeopleDetails>(_fetchPeopleDetails);
  }
  _fetchPeopleDetails(
      FetchPeopleDetails event, Emitter<PeopleDetailsState> emit) async {
    emit(PeopleDetailsLoading());
    try {
      final peopleDetails =
          await movieRepository.fetchPeopleDetails(id: event.id);
      emit(PeopleDetailsLoaded(peopleDetails: peopleDetails));
    } catch (e) {
      emit(PeopleDetailsFailed());
    }
  }
}

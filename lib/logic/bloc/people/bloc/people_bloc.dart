import 'package:bloc/bloc.dart';
import 'package:movie_app/data/model/people.dart';
import 'package:movie_app/data/repository/tdbmovie_repository.dart';

part 'people_event.dart';
part 'people_state.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  final MovieRepository movieRepository;
  int page = 1;
  PeopleBloc({required this.movieRepository}) : super(PeopleInitial()) {
    on<FetchPopularPeopleEvent>(_fetchPopularPeople);
  }
  _fetchPopularPeople(
      FetchPopularPeopleEvent event, Emitter<PeopleState> emit) async {
    final currentState = state;
    try {
      if (currentState is PeopleInitial) {
        final popularPeoples =
            await movieRepository.fetchPopularPeople(page: page);
        emit(PeopleSuccess(persons: popularPeoples, hasReachedMax: false));
      }
      if (currentState is PeopleSuccess) {
        final popularPeoples =
            await movieRepository.fetchPopularPeople(page: ++page);
        emit(
          popularPeoples.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PeopleSuccess(
                  persons: currentState.persons + popularPeoples,
                  hasReachedMax: false),
        );
      }
    } catch (e) {
      emit(PeopleFailed());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/model/movie_models.dart';
import 'package:movie_app/data/repository/tdbmovie_repository.dart';
import 'package:movie_app/data/repository/tmdb_api_client.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final MovieRepository movieRepository;
  int page = 1;

  UpcomingBloc({required this.movieRepository}) : super(UpcomingInitial()) {
    on<FetchUpComingMovie>(_fetchUpComingMovie);
  }
  _fetchUpComingMovie(
      FetchUpComingMovie event, Emitter<UpcomingState> emit) async {
    final currentState = state;
    try {
      if (currentState is UpcomingInitial) {
        final movies = await movieRepository.fetchUpcComingMovie(page: page);
        emit(UpcomingSuccess(upComingMovie: movies, hasReachedMax: false));
      }
      if (currentState is UpcomingSuccess) {
        final movies = await movieRepository.fetchUpcComingMovie(page: ++page);
        emit(
          movies.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : UpcomingSuccess(
                  upComingMovie: currentState.upComingMovie + movies,
                  hasReachedMax: false),
        );
      }
    } catch (e) {
      print("Upcoming ${e}");
      emit(UpcomingFailed());
    }
  }
}

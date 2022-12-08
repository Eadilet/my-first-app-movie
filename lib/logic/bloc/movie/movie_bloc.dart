import 'package:bloc/bloc.dart';
import 'package:movie_app/data/model/movie_models.dart';
import 'package:movie_app/data/repository/tdbmovie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;
  int page = 1;

  MovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<FetchMovie>(_fetchMovie);
  }

  _fetchMovie(FetchMovie event, Emitter<MovieState> emit) async {
    final currentState = state;
    emit(MovieInitial());
    try {
      if (currentState is MovieInitial) {
        final movies = await movieRepository.fetchMovie(page: page);
        emit(MovieSuccess(movies: movies, hasReachedMax: false));
      }
      if (currentState is MovieSuccess) {
        final movies = await movieRepository.fetchMovie(page: ++page);
        emit(movies.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : MovieSuccess(
                movies: currentState.movies + movies, hasReachedMax: false));
      }
    } catch (e) {
      print(e);
      emit(MovieFailed());
    }
  }
  // Stream<MovieState> mapEventToState(MovieEvent event) async* {
  //   final currentState = state;
  //   if (event is FetchMovie) {
  //     try {
  //       if (currentState is MovieInitial) {
  //         final movies = await movieRepository.fetchMovie(page: page);
  //         yield MovieSuccess(movies: movies, hasReachedMax: false);
  //       }
  //       if (currentState is MovieSuccess) {
  //         final movies = await movieRepository.fetchMovie(page: ++page);
  //         yield movies.isEmpty
  //             ? currentState.copyWith(hasReachedMax: true)
  //             : MovieSuccess(
  //                 movies: currentState.movies + movies, hasReachedMax: false);
  //       }
  //     } catch (_) {
  //       yield MovieFailed();
  //     }
  //   }
  // }
}

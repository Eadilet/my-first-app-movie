import 'package:bloc/bloc.dart';
import 'package:movie_app/data/model/movie_detail_models.dart';
import 'package:movie_app/data/repository/tdbmovie_repository.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieRepository movieRepository;

  MovieDetailsBloc({required this.movieRepository})
      : super(MovieDetailsInitial()) {
    on<FetchingMovieDetails>(_fetchMovieDetails);
  }
  _fetchMovieDetails(
      FetchingMovieDetails event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoading());
    try {
      MovieDetails movieDetails =
          await movieRepository.fetchMovieDetails(id: event.id);
      emit(MovieDetailsLoaded(movie: movieDetails));
    } catch (e) {
      emit(MovieDetailsFailed());
    }
  }
}

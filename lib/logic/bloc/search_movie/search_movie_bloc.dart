import 'package:bloc/bloc.dart';
import 'package:movie_app/data/model/movie_models.dart';
import 'package:movie_app/data/repository/tdbmovie_repository.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieSearched> {
  final MovieRepository movieRepository;
  int page = 1;
  SearchMovieBloc({required this.movieRepository})
      : super(SearchMovieSearched()) {
    on<FetchSearchingMovie>(_fetchSearchingMovie);
  }
  _fetchSearchingMovie(
      FetchSearchingMovie event, Emitter<SearchMovieSearched> emit) async {
    emit(state.copyWith(isLoading: true));
    final movies = await movieRepository.fetchSearchingMovie(
        query: event.movieName, page: page);
    emit(state.copyWith(searchingMovies: movies, isLoading: false));
  }
}

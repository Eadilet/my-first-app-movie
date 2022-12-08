import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/model/cast.dart';
import 'package:movie_app/data/repository/tdbmovie_repository.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final MovieRepository movieRepository;
  CastBloc({required this.movieRepository}) : super(CastInitial()) {
    on<FetchMovieCast>(_fetchCast);
  }
  _fetchCast(FetchMovieCast event, Emitter<CastState> emit) async {
    emit(CastLoading());
    try {
      final cast = await movieRepository.fetchMovieCast(id: event.movieId);
      emit(CastLoaded(cast: cast));
    } catch (e) {
      emit(CastFailed());
    }
  }
}

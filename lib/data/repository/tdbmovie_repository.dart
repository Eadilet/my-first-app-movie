import 'package:movie_app/data/model/cast.dart';
import 'package:movie_app/data/model/movie_detail_models.dart';
import 'package:movie_app/data/model/movie_models.dart';
import 'package:movie_app/data/model/people.dart';
import 'package:movie_app/data/model/people_details.dart';
import 'package:movie_app/data/repository/tmdb_api_client.dart';

class MovieRepository {
  final TMDBApiClient tmdbApiClient;

  MovieRepository({required this.tmdbApiClient});

  Future<List<Movie>> fetchMovie({required int page}) async {
    return await tmdbApiClient.fetchMovie(page: page);
  }

  Future<MovieDetails> fetchMovieDetails({required int id}) async {
    return await tmdbApiClient.fetchMovieDetails(id: id);
  }

  Future<List<Cast>> fetchMovieCast({required int id}) async {
    return await tmdbApiClient.fetchMovieCast(id: id);
  }

  Future<List<Movie>> fetchUpcComingMovie({required int page}) async {
    return await tmdbApiClient.fetchUpComingMovie(page: page);
  }

  Future<List<Person>> fetchPopularPeople({required int page}) async {
    return await tmdbApiClient.fetchPopularPeople(page: page);
  }

  Future<List<Movie>> fetchSearchingMovie(
      {required String query, required int page}) async {
    return await tmdbApiClient.fetchSearchingMovie(query: query, page: page);
  }

  Future<PeopleDetails> fetchPeopleDetails({required int id}) async {
    return await tmdbApiClient.fetchPeopleDetails(id: id);
  }
}

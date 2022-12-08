import 'dart:convert';

import 'package:movie_app/const/api_const/api_const.dart';
import 'package:movie_app/data/model/cast.dart';
import 'package:movie_app/data/model/movie_detail_models.dart';
import 'package:movie_app/data/model/movie_models.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/data/model/people.dart';
import 'package:movie_app/data/model/people_details.dart';

class TMDBApiClient {
  Future<List<Movie>> fetchMovie({required int page}) async {
    final List<Movie> movies = [];

    final url = Uri.parse(
        "$baseUrl/movie/popular?api_key=$api_key&language=$language&region=$region&page=$page");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception(
          "Fetching Movies expation file: tmdb_api_client.dart/ EXAPTION STATUS CODE: ${response.statusCode}");
    }
    final decodeJson = jsonDecode(response.body);
    for (var element in (decodeJson['results'] as List)) {
      movies.add(Movie.fromJson(element));
    }
    return movies;
  }

  Future<MovieDetails> fetchMovieDetails({required int id}) async {
    // https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=en-US
    final url = Uri.parse(
        "$baseUrl/movie/$id}?api_key=$api_key&language=$language&region=$region");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception(
          "Fetching Movies Details expation file: tmdb_api_client.dart/ EXAPTION STATUS CODE: ${response.statusCode}");
    }
    final decodeJson = jsonDecode(response.body);
    return MovieDetails.fromJson(decodeJson);
  }

  Future<List<Cast>> fetchMovieCast({required int id}) async {
    // https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=<<api_key>>&language=en-US
    List<Cast> cast = [];
    final url = Uri.parse(
        "$baseUrl/movie/$id}/credits?api_key=$api_key&language=$language&region=$region");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception(
          "Fetching Movie Casts expation file: tmdb_api_client.dart/ EXAPTION STATUS CODE: ${response.statusCode}");
    }
    final decodeJson = jsonDecode(response.body);
    for (var element in (decodeJson['cast'] as List)) {
      cast.add(Cast.fromJson(element));
    }
    return cast;
  }

  Future<List<Movie>> fetchUpComingMovie({required int page}) async {
    // https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1
    List<Movie> upComingMovie = [];
    final url = Uri.parse(
        "$baseUrl/movie/upcoming?api_key=$api_key&language=$language&region=$region&page=$page");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception(
          "Fetching Up Coming Movies expation file: tmdb_api_client.dart/ EXAPTION STATUS CODE: ${response.statusCode}");
    }
    final decodeJson = jsonDecode(response.body);
    for (var element in (decodeJson['results'] as List)) {
      upComingMovie.add(Movie.fromJson(element));
    }
    return upComingMovie;
  }

  Future<List<Person>> fetchPopularPeople({required int page}) async {
    // api.themoviedb.org/3/person/popular?api_key=<<api_key>>&language=en-US&page=1
    // https://api.themoviedb.org/3/person/popular?api_key=<<api_key>>&language=en-US&page=1
    List<Person> popularPerson = [];
    final url = Uri.parse(
        "$baseUrl/person/popular?api_key=$api_key&language=en-Us&page=$page");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception(
          "Fetching Popular Peoples expation file: tmdb_api_client.dart/ EXAPTION STATUS CODE: ${response.statusCode}");
    }
    final decodeJson = jsonDecode(response.body);
    for (var element in (decodeJson['results'] as List)) {
      popularPerson.add(Person.fromJson(element));
    }
    return popularPerson;
  }

  Future<List<Movie>> fetchSearchingMovie(
      {required String query, required int page}) async {
    //https://api.themoviedb.org/3/search/movie?api_key=a6a59741fdd3de5cdf8dd3969cf8e317&page=1&query=
    List<Movie> searchinMovie = [];
    final url = Uri.parse(
        "$baseUrl/search/movie?api_key=$api_key&page=$page&query=$query");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception(
          "Fetch Searching Movies expation file: tmdb_api_client.dart/ EXAPTION STATUS CODE: ${response.statusCode}");
    }
    final decodeJson = jsonDecode(response.body);
    for (var element in (decodeJson['results'] as List)) {
      searchinMovie.add(Movie.fromJson(element));
    }
    return searchinMovie;
  }

  Future<PeopleDetails> fetchPeopleDetails({required int id}) async {
    //https://api.themoviedb.org/3/person/{person_id}?api_key=<<api_key>>&language=en-US

    final url =
        Uri.parse("$baseUrl/person/$id?api_key=$api_key&language=$language");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception(
          "Fetching People Details expation file: tmdb_api_client.dart/ EXAPTION STATUS CODE: ${response.statusCode}");
    }
    final decodeJson = jsonDecode(response.body);

    return PeopleDetails.fromJson(decodeJson);
  }
}

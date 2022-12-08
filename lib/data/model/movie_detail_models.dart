import 'package:movie_app/data/model/genre.dart';
import 'package:movie_app/data/model/production_company.dart';
import 'package:movie_app/data/model/production_country.dart';
import 'package:movie_app/data/model/spoken_language.dart';

class MovieDetails {
  String? backdrop_path;
  int budget;
  List<Genre>? genres;

  int id;

  String? original_language;
  String? original_title;
  String? overview;
  double popularity;
  String? poster_path;
  List<ProductionCompany>? production_companies;
  List<ProductionCountry>? production_countries;
  String? release_date;
  int runtime;
  List<SpokenLanguage>? spoken_languages;

  String? tagline;
  String? title;

  num vote_average;
  num vote_count;

  MovieDetails(
      {required this.backdrop_path,
      required this.budget,
      required this.genres,
      required this.id,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.popularity,
      required this.poster_path,
      required this.production_companies,
      required this.production_countries,
      required this.release_date,
      required this.runtime,
      required this.spoken_languages,
      required this.tagline,
      required this.title,
      required this.vote_average,
      required this.vote_count});

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      backdrop_path: json['backdrop_path'],
      budget: json['budget'],
      genres: json['genres'] != null
          ? (json['genres'] as List).map((i) => Genre.fromJson(i)).toList()
          : null,
      id: json['id'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      production_companies: json['production_companies'] != null
          ? (json['production_companies'] as List)
              .map((i) => ProductionCompany.fromJson(i))
              .toList()
          : null,
      production_countries: json['production_countries'] != null
          ? (json['production_countries'] as List)
              .map((i) => ProductionCountry.fromJson(i))
              .toList()
          : null,
      release_date: json['release_date'],
      runtime: json['runtime'],
      spoken_languages: json['spoken_languages'] != null
          ? (json['spoken_languages'] as List)
              .map((i) => SpokenLanguage.fromJson(i))
              .toList()
          : null,
      tagline: json['tagline'],
      title: json['title'],
      vote_average: json['vote_average'].toDouble(),
      vote_count: json['vote_count'],
    );
  }
}

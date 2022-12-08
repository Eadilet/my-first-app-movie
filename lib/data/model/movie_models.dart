class Movie {
  String? backdrop_path;
  int id;
  String? original_language;
  String? original_title;
  String? overview;
  double popularity;
  String? poster_path;
  String? release_date;
  String? title;
  num vote_average;
  num vote_count;

  Movie(
      {required this.backdrop_path,
      required this.id,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.popularity,
      required this.poster_path,
      required this.release_date,
      required this.title,
      required this.vote_average,
      required this.vote_count});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        backdrop_path: json["backdrop_path"],
        id: json["id"],
        original_language: json["original_language"],
        original_title: json["original_title"],
        overview: json["overview"],
        poster_path: json["poster_path"],
        release_date: json["release_date"],
        title: json["title"],
        vote_average: json["vote_average"],
        vote_count: json["vote_count"],
        popularity: json['popularity']);
  }
}

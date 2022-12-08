class PeopleDetails {
  final String? birthday;
  final int id;
  final String name;
  final List<String>? know_as;
  final String biography;
  final double popularity;
  final String? place_of_birth;
  final String? profile_path;

  PeopleDetails({
    required this.birthday,
    required this.id,
    required this.name,
    required this.know_as,
    required this.biography,
    required this.popularity,
    required this.place_of_birth,
    required this.profile_path,
  });

  factory PeopleDetails.fromJson(Map<String, dynamic> json) {
    return PeopleDetails(
      birthday: json['birthday'],
      id: json["id"],
      name: json["name"],
      know_as: json["also_know_as"],
      biography: json["biography"],
      popularity: json["popularity"],
      place_of_birth: json["place_of_birth"],
      profile_path: json["profile_path"],
    );
  }
}

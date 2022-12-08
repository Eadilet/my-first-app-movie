class SpokenLanguage {
  String? iso_639_1;
  String? name;

  SpokenLanguage({required this.iso_639_1, required this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      iso_639_1: json['iso_639_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['iso_639_1'] = iso_639_1;
    data['name'] = name;
    return data;
  }
}

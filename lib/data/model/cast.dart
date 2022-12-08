class Cast {
  int cast_id;
  String character;
  String credit_id;
  int gender;
  int id;
  String name;
  int order;
  String? profile_path;

  Cast(
      {required this.cast_id,
      required this.character,
      required this.credit_id,
      required this.gender,
      required this.id,
      required this.name,
      required this.order,
      required this.profile_path});

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      cast_id: json['cast_id'],
      character: json['character'],
      credit_id: json['credit_id'],
      gender: json['gender'],
      id: json['id'],
      name: json['name'],
      order: json['order'],
      profile_path: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cast_id'] = cast_id;
    data['character'] = character;
    data['credit_id'] = credit_id;
    data['gender'] = gender;
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['profile_path'] = profile_path;
    return data;
  }
}

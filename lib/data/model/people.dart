class Person {
  final int id;
  final String name;
  final String? profile_path;

  Person({required this.name, required this.profile_path, required this.id});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        name: json['name'], profile_path: json['profile_path'], id: json['id']);
  }
}

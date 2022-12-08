class ProductionCompany {
  final int id;
  final String? logo_path;
  final String? name;
  final String? origin_country;

  ProductionCompany(
      {required this.id,
      required this.logo_path,
      required this.name,
      required this.origin_country});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      logo_path: json['logo_path'],
      name: json['name'],
      origin_country: json['origin_country'],
    );
  }

}

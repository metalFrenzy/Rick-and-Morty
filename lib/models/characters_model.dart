class CharacterModel {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? gender;
  final Origin? origin;
  final Origin? location;
  final String? image;

  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.origin,
    this.location,
     this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        gender: json['gender'],
        origin: Origin.fromJson(json["origin"]),
        location: Origin.fromJson(json['location']),
        image: json['image'],
      );
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
        name: json['name'],
        url: json['url'],
      );
}

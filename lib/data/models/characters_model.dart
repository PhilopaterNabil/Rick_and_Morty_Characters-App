class Origin {
  late String name;
  late String url;

  Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Location {
  late String name;
  late String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      url: json['url'],
    );
  }
}

class CharactersModel {
  late int id;
  late String name;
  late String status;
  late String species;
  late String gender;
  late Origin origin;
  late Location location;
  late String image;
  late List<String> episode;

  CharactersModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      id: json['id'],
      name: json['name'], 
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      origin: Origin.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode']),
    );
  }
}

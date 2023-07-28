// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

class Pokemon {
  final String id;
  final String number;
  final String name;
  final Anatomy weight;
  final Anatomy height;
  final String classification;
  final List<String> types;
  final List<String> resistant;
  final List<String> weaknesses;
  final double fleeRate;
  final int maxCp;
  final int maxHp;
  final String image;

  Pokemon({
    required this.id,
    required this.number,
    required this.name,
    required this.weight,
    required this.height,
    required this.classification,
    required this.types,
    required this.resistant,
    required this.weaknesses,
    required this.fleeRate,
    required this.maxCp,
    required this.maxHp,
    required this.image,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        number: json["number"],
        name: json["name"],
        weight: Anatomy.fromJson(json["weight"]),
        height: Anatomy.fromJson(json["height"]),
        classification: json["classification"],
        types: List<String>.from(json["types"].map((x) => x)),
        resistant: List<String>.from(json["resistant"].map((x) => x)),
        weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
        fleeRate: json["fleeRate"]?.toDouble(),
        maxCp: json["maxCP"],
        maxHp: json["maxHP"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "name": name,
        "weight": weight.toJson(),
        "height": height.toJson(),
        "classification": classification,
        "types": List<dynamic>.from(types.map((x) => x)),
        "resistant": List<dynamic>.from(resistant.map((x) => x)),
        "weaknesses": List<dynamic>.from(weaknesses.map((x) => x)),
        "fleeRate": fleeRate,
        "maxCP": maxCp,
        "maxHP": maxHp,
        "image": image,
      };
}

class Anatomy {
  final String minimum;
  final String maximum;

  Anatomy({
    required this.minimum,
    required this.maximum,
  });

  factory Anatomy.fromJson(Map<String, dynamic> json) => Anatomy(
        minimum: json["minimum"],
        maximum: json["maximum"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "maximum": maximum,
      };
}

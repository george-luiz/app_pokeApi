import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) => PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  PokemonModel({
    required this.sprites,
    required this.name,
  });

  Sprites sprites;
  String name;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
    sprites: Sprites.fromJson(json["sprites"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "sprites": sprites.toJson(),
    "name": name,
  };
}

class Sprites {
  Sprites({
    required this.other,
  });

  Other other;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    other: Other.fromJson(json["other"]),
  );

  Map<String, dynamic> toJson() => {
    "other": other.toJson(),
  };
}

class Other {
  Other({
    required this.home,
  });

  Home home;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    home: Home.fromJson(json["home"]),
  );

  Map<String, dynamic> toJson() => {
    "home": home.toJson(),
  };
}

class Home {
  Home({
    required this.frontDefault,
  });

  String frontDefault;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    frontDefault: json["front_default"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
  };
}

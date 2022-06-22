import 'dart:convert';

PokemonModel homeModelFromJson(String str) => PokemonModel.fromJson(json.decode(str));

String homeModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  PokemonModel({
    required this.sprites,
  });

  Sprites sprites;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
    sprites: Sprites.fromJson(json["sprites"]),
  );

  Map<String, dynamic> toJson() => {
    "sprites": sprites.toJson(),
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
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
  };
}

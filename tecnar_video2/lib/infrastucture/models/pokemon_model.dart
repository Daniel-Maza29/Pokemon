import '../../domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required super.name,
    required super.image,
    required super.type,
    required super.ability,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      image: json['sprites']['front_default'],
      type: json['types'][0]['type']['name'],
      ability: json['abilities'][0]['ability']['name'],
    );
  }
}
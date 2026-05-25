import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/pokemon.dart';
import '../../domain/datasource/pokemon_datasource.dart';

import '../models/pokemon_model.dart';

class PokemonDatasourceImpl implements PokemonDatasource {

  @override
  Future<Pokemon> getPokemon(String name) async {

    final url = Uri.parse(
      'https://pokeapi.co/api/v2/pokemon/$name',
    );

    final response = await http.get(url);

    // Validar si el pokemon existe
    if (response.statusCode != 200) {
      throw Exception('Pokemon no encontrado');
    }

    final data = jsonDecode(response.body);

    return PokemonModel.fromJson(data);
  }
}
import 'package:flutter/material.dart';

import '../../domain/entities/pokemon.dart';

import '../../infrastucture/datasources/pokemon_datasource_impl.dart';
import '../../infrastucture/repositories/pokemon_repository_impl.dart';

class ChatProvider extends ChangeNotifier {

  final repository = PokemonRepositoryImpl(
    PokemonDatasourceImpl(),
  );

  Pokemon? pokemon;

  String errorMessage = '';

  Future<void> searchPokemon(String name) async {

    try {

      errorMessage = '';

      pokemon = await repository.getPokemon(name);

    } catch (e) {

      pokemon = null;

      errorMessage = 'Pokemon no encontrado';
    }

    notifyListeners();
  }
}
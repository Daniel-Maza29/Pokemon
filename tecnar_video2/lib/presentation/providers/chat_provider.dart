import 'package:flutter/material.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/pokemon.dart';

import '../../infrastucture/datasources/pokemon_datasource_impl.dart';
import '../../infrastucture/repositories/pokemon_repository_impl.dart';

class ChatProvider extends ChangeNotifier {

  final repository = PokemonRepositoryImpl(
    PokemonDatasourceImpl(),
  );

  Pokemon? pokemon;
  List<Message> messages = [];
  bool isLoading = false;
  

  String errorMessage = '';

  Future<void> searchPokemon(String name) async {

  isLoading = true;

  messages.add(
    Message(
      text: name,
      isUser: true,
    ),
  );

  notifyListeners();

  try {

    errorMessage = '';

    pokemon = await repository.getPokemon(name);

    messages.add(
      Message(
        text: pokemon!.name,
        isUser: false,
        imageUrl: pokemon!.image,
      ),
    );

  } catch (e) {

    pokemon = null;

    errorMessage = 'Pokemon no encontrado';

    messages.add(
      Message(
        text: 'Pokemon no encontrado',
        isUser: false,
      ),
    );
  }

  isLoading = false;

  notifyListeners();
}}
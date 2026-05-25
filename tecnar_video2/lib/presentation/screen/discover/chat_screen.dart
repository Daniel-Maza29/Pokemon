import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {

  ChatScreen({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<ChatProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
  children: [

    TextField(
      controller: controller,
    ),

    ElevatedButton(
      onPressed: () {
        provider.searchPokemon(
          controller.text
              .trim()
              .toLowerCase(),
        );
      },
      child: const Text('Buscar'),
    ),

    const SizedBox(height: 20),

    if(provider.errorMessage.isNotEmpty)
      Text(
        provider.errorMessage,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 18,
        ),
      ),

    if(provider.pokemon != null)
      Column(
        children: [

          Image.network(
            provider.pokemon!.image,
            height: 150,
          ),

          Text(provider.pokemon!.name),
          Text(provider.pokemon!.type),
          Text(provider.pokemon!.ability),
        ],
      )
  ],
),
      ),
    );
  }
}
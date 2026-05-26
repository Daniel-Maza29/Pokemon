import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {

  ChatScreen({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<ChatProvider>();
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: AppBar(

  title: const Text(
    'Danii PokeChat',
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),

  centerTitle: true,

  elevation: 0,

  actions: [

    IconButton(

      onPressed: () {

        themeProvider.toggleTheme();
      },

      icon: Icon(

        themeProvider.isDarkMode
            ? Icons.light_mode
            : Icons.dark_mode,
      ),
    ),
  ],
),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // INPUT
            Container(

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius: BorderRadius.circular(15),

                boxShadow: const [

                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                  ),
                ],
              ),

              child: TextField(

                controller: controller,

                decoration: const InputDecoration(

                  hintText: 'Escribe un pokemon...',

                  prefixIcon: Icon(Icons.catching_pokemon),

                  border: InputBorder.none,

                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // BOTON
            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(

                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {

                  provider.searchPokemon(
                    controller.text
                        .trim()
                        .toLowerCase(),
                  );

                  controller.clear();
                },

                child: const Text(
                  'Buscar Pokemon',
                  style: TextStyle(fontSize: 16),
                ),
              ),
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

            // MENSAJES
            Expanded(

              child: ListView.separated(

  itemCount: provider.messages.length,

  separatorBuilder: (_, __) =>
      const SizedBox(height: 5),

  itemBuilder: (context, index) {

    final message = provider.messages[index];

    return AnimatedContainer(

      duration: const Duration(milliseconds: 400),

      curve: Curves.easeInOut,

      child: AnimatedOpacity(

        duration: const Duration(milliseconds: 500),

        opacity: 1,

        child: Align(

          alignment: message.isUser
              ? Alignment.centerRight
              : Alignment.centerLeft,

          child: Container(

            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),

            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),

            decoration: BoxDecoration(

              color: message.isUser
                  ? Colors.blue
                  : Colors.white,

              borderRadius: BorderRadius.circular(20),

              boxShadow: const [

                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                ),
              ],
            ),

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(

                  message.text,

                  style: TextStyle(

                    color: message.isUser
                        ? Colors.white
                        : Colors.black,

                    fontSize: 16,
                  ),
                ),

                if(message.imageUrl != null)

                  Padding(

                    padding: const EdgeInsets.only(top: 10),

                    child: ClipRRect(

                      borderRadius:
                          BorderRadius.circular(15),

                      child: Image.network(
                        message.imageUrl!,
                        height: 120,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  },
),
            ),
          ],
        ),
      ),
    );
  }
}
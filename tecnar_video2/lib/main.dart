import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tecnar_video2/config/theme/app_theme.dart';
import 'package:tecnar_video2/presentation/providers/chat_provider.dart';
import 'package:tecnar_video2/presentation/screen/discover/chat_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon Chat',
      theme: AppTheme().getTheme(),

      home: ChatScreen(),
    );
  }
}
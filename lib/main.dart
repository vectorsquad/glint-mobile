import 'package:flutter/material.dart';
import 'package:login_signup/models/deckListModel.dart';
import 'package:login_signup/screens/welcomeScreen.dart';
import 'package:login_signup/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DeckListModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Glint',
          theme: lightMode,
          home: const WelcomeScreen(),
        )
    );
  }
}
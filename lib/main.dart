import 'package:flutter/material.dart';
import 'package:login_signup/theme/theme.dart';
import 'package:login_signup/widgets/routes/routes.dart';
import 'package:provider/provider.dart';

import 'notifiers/notifiers.dart';

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
          ChangeNotifierProvider(create: (context) => DeckListNotifier()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Glint',
          theme: lightMode,
          home: const ExhaustiveLoginRoute(),
        ));
  }
}

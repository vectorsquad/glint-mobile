import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ApiConfigNotifier()),
        ],
        child:MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Glint',
          theme: lightMode,
          home: const ExhaustiveLoginRoute(),
        ));
  }
}

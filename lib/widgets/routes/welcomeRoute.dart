part of '../routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: WelcomePage(),
    );
  }
}
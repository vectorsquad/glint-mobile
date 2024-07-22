part of 'routes.dart';

class WelcomeRoute extends StatelessWidget {
  const WelcomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: WelcomePage(),
    );
  }
}

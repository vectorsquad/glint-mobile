part of '../routes.dart';

class DeckListScreen extends StatelessWidget {

  const DeckListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: DeckListPage(),
    );

  }
}

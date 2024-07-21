part of 'primitives.dart';

bool isState(AsyncSnapshot snapshot, ConnectionState connState) {
  return snapshot.connectionState == connState;
}

class DeckListViewer extends StatelessWidget {
  const DeckListViewer({super.key});

  @override
  Widget build(BuildContext context) => Consumer<DeckListNotifier>(
      builder: (context, model, child) {

        log("lmao");
        log("lmao");
        log("lmao");
        log("lmao");
        log("lmao");

          final List<Widget> deckCardBoxes = [];

          for (final deckProp in model.cached) {
            deckCardBoxes.add(DeckBox(deckProp));
          }

          return Column(children: deckCardBoxes);
        },
  );
}

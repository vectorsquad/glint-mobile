part of 'primitives.dart';

class DeckListViewer extends StatelessWidget {
  const DeckListViewer({super.key});

  @override
  Widget build(BuildContext context) => Consumer<DeckListNotifier>(
      builder: (context, model, child) => FutureBuilder(
            future: model.deckList,
            builder: (context, snapshot) {
              final isWaiting =
                  snapshot.connectionState == ConnectionState.waiting;
              final isActive =
                  snapshot.connectionState == ConnectionState.active;

              if (isActive || isWaiting) {
                return const CircularProgressIndicator(
                    backgroundColor: Colors.green);
              }

              final data = snapshot.data;

              if (snapshot.connectionState == ConnectionState.done &&
                  data != null) {
                final Val(:ok, :other) = data;

                if (ok == null) {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      text: other);
                  return const Text("No Decks Created");
                }

                final List<Widget> deckCardBoxes = [];

                for (final deckProp in ok.decks) {
                  deckCardBoxes.add(DeckBox(deckProp));
                }

                return Column(children: deckCardBoxes);
              }

              return const Text("No Decks Created");
            },
          ));
}

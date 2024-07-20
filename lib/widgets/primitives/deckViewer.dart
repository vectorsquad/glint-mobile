part of 'primitives.dart';

bool isState(AsyncSnapshot snapshot, ConnectionState connState) {
  return snapshot.connectionState == connState;
}

class DeckListViewer extends StatelessWidget {
  const DeckListViewer({super.key});

  @override
  Widget build(BuildContext context) => Consumer<DeckListNotifier>(
      builder: (context, model, child) => FutureBuilder(
            future: model.deckList,
            builder: (context, snapshot) {

              // final isWaiting = isState(snapshot, ConnectionState.waiting);
              // final isActive = isState(snapshot, ConnectionState.active);
              final isNone = isState(snapshot, ConnectionState.none);

              if(isNone) {
                return const Text("No Decks Created");
              }

              final data = snapshot.data;

              // Indicate if busy retrieving data/current data is null
              if (snapshot.connectionState != ConnectionState.done || data == null) {
                return const CircularProgressIndicator(
                    backgroundColor: Colors.green);
              }

              final Val(:ok, :other) = data;
              if (ok == null) {
                return Text("Error Retrieving List Of Decks:\n$other");
              }

              final List<Widget> deckCardBoxes = [];

              for (final deckProp in ok.decks) {
                deckCardBoxes.add(DeckBox(deckProp));
              }

              return Column(children: deckCardBoxes);
            },
      ));
}

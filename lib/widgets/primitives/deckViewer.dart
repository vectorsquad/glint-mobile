part of 'primitives.dart';

class DeckListViewer extends StatelessWidget {
  const DeckListViewer({super.key});

  @override
  Widget build(BuildContext context) => Consumer<DeckListNotifier>(
      builder: (context, model, child) => FutureBuilder(
        future: model.deckList,
        builder: (context, snapshot) {

          final isWaiting = snapshot.connectionState == ConnectionState.waiting;
          final isActive = snapshot.connectionState == ConnectionState.active;

          if(isActive || isWaiting) {
            return const CircularProgressIndicator(backgroundColor: Colors.green);
          }

          if(snapshot.connectionState == ConnectionState.none) {

            final ok = snapshot.data?.ok;
            if(ok == null) {
              return const CircularProgressIndicator(backgroundColor: Colors.green);
            }

            final List<Widget> deckCardBoxes = [];

            for(final deckProp in ok.decks) {
              deckCardBoxes.add(DeckBox(deckProp));
            }

            return Column(children: deckCardBoxes);
          }

          return const CircularProgressIndicator(backgroundColor: Colors.green,);

        },
      )
  );

}
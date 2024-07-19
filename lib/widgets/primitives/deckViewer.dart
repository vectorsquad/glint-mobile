part of '../primitives.dart';

class DeckListViewer extends StatelessWidget {
  const DeckListViewer({super.key});

  @override
  Widget build(BuildContext context) => Consumer<DeckListModel>(
      builder: (context, model, child) => FutureBuilder(
        future: model.deckList,
        builder: (context, snapshot) {

          final data = snapshot.data;

          if(snapshot.connectionState == ConnectionState.done && data != null) {

            final List<Widget> deckCardBoxes = [];

            for(final deckProp in data) {
              deckCardBoxes.add(DeckBox(deckProp));
            }

            return Column(children: deckCardBoxes);
          }

          return const CircularProgressIndicator(backgroundColor: Colors.green,);

        },
      )
  );

}
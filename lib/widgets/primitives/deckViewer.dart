part of 'primitives.dart';

class DeckListViewer extends StatelessWidget {
  const DeckListViewer({super.key});

  @override
  Widget build(BuildContext context) => Consumer<DeckListNotifier>(
        builder: (context, model, child) {
          final List<Widget> deckCardBoxes = [];

          for (var i = 0; i < model.cached.length; i++) {
            final deckProp = model.cached[i];
            deckCardBoxes.add(DeckBox(deckProp));

            // Add spacer if more items
            if (i + 1 < model.cached.length) {
              const spacer = SizedBox(width: 20, height: 20);
              deckCardBoxes.add(spacer);
            }
          }

          return Column(children: deckCardBoxes);
        },
      );
}

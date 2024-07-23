part of 'primitives.dart';

class DeckListViewer extends StatelessWidget {
  const DeckListViewer({super.key});

  @override
  Widget build(BuildContext context) => Consumer<DeckListNotifier>(
      builder: (context, deckListModel, child) => ListView.builder(
          shrinkWrap: true,
          itemCount: deckListModel.cached.length,
          itemBuilder: (context, index) => Column(
              children: [
                ChangeNotifierProvider(
                    create: (_) => CheckedStateNotifier(),
                    child: Consumer<CheckedStateNotifier>(
                        builder: (context, checkedState, child) => Consumer<CheckedCountNotifier>(
                            builder: (context, checkedCount, child) => Column(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      final props = deckListModel.cached[index];

                                      if(!checkedCount.none) {
                                        checkedState.toggle((b) {
                                          checkedCount.mutate = b;
                                          deckListModel.markDelete(b, props.id, props);
                                        });
                                        return;
                                      }

                                    },
                                    onLongPress: () {
                                      final props = deckListModel.cached[index];

                                      HapticFeedback.vibrate();
                                      checkedState.toggle((b) {
                                        checkedCount.mutate = b;
                                        deckListModel.markDelete(b, props.id, props);
                                      });
                                    },
                                    child: ListTile(
                                      leading: checkedCount.none ?
                                      const Text(""):
                                      Checkbox(
                                          value: checkedState.checked, onChanged: (bool? value) {  }
                                      ),
                                      title: Text(deckListModel.cached[index].name),
                                    )
                                ),
                                const Divider()
                              ],
                            )
                        )
                    )
                )
              ]
          )
      )
  );
}

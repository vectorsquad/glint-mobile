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
                    create: (_) => CheckboxStateNotifier(),
                    child: Consumer<CheckboxStateNotifier>(
                        builder: (context, checkboxState, child) => Consumer<ShowCheckboxNotifier>(
                            builder: (context, showCheckboxModel, child) => Column(
                              children: [
                                GestureDetector(
                                    onTap: () async {

                                      if(showCheckboxModel.showCheckbox) {
                                        checkboxState.toggle();

                                        showCheckboxModel.mutateChecked(checkboxState.enabled);

                                        if(showCheckboxModel.checked == 0) {
                                          showCheckboxModel.hide();
                                        }

                                        return;
                                      }

                                      await pushRoute(
                                          context,
                                          SelectedSetPage(props: deckListModel.cached[index])
                                      );
                                      await deckListModel.refresh();

                                    },
                                    onLongPress: () {
                                      HapticFeedback.vibrate();
                                      checkboxState.toggle();
                                      showCheckboxModel.mutateChecked(checkboxState.enabled);

                                      if(showCheckboxModel.checked == 0) {
                                        showCheckboxModel.hide();
                                      } else {
                                        showCheckboxModel.show();
                                      }

                                    },
                                    child: ListTile(
                                      leading: showCheckboxModel.showCheckbox ?
                                      Checkbox(
                                          value: checkboxState.enabled, onChanged: (bool? value) {  }
                                      )
                                          : const Text(""),
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

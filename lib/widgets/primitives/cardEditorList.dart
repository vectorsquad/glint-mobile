part of 'primitives.dart';

class CardEditorList extends StatelessWidget {

  final Deck props;

  const CardEditorList(
      {
        super.key,
        required this.props
      }
      );

  @override
  Widget build(BuildContext context) => Consumer<CardListNotifier>(
      builder: (context, model, child) => Theme(
          data: ThemeData(
              canvasColor: Colors.transparent
          ),
          child: ReorderableListView.builder(
              itemCount: model.cached.length,
              shrinkWrap: true,
              onReorder: (oldIndex, newIndex) async {

                log("old index, new index");
                log("$oldIndex, $newIndex");

                final Val(ok:swapOk) = await swapCards(
                    model.cached[oldIndex],
                    model.cached[newIndex]
                );

                if (swapOk == null) {
                  return;
                }

                await model.refresh();
              },
              itemBuilder: (context, index) => CardEditor(
                props: model.cached[index],
                key: ValueKey(model.cached[index].id),
              )
          )
      )
  );

}
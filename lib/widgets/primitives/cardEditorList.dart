part of 'primitives.dart';

Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
  return AnimatedBuilder(
    animation: animation,
    builder: (BuildContext context, Widget? child) {
      return Material(
        elevation: 0,
        color: Colors.transparent,
        child: child,
      );
    },
    child: child,
  );
}

class CardEditorList extends StatelessWidget {

  final Deck props;

  const CardEditorList(
      {
        super.key,
        required this.props
      }
      );

  @override
  Widget build(BuildContext context) =>
      Consumer<CardListNotifier>(
          builder: (context, model, child) {
            log("lmao");
            log("lmao");
            log("cheese");
            log(jsonEncode(model.cached));
            log("cheese");
            log("lmao");
            log("lmao");

            return ReorderableListView(
                physics: const NeverScrollableScrollPhysics(),
                proxyDecorator: proxyDecorator,
                shrinkWrap: true,
                onReorder: (oldIndex, newIndex) async {
                  final Val(ok:swapOk) = await swapCards(
                      model.cached[oldIndex],
                      model.cached[newIndex]
                  );

                  if (swapOk == null) {
                    return;
                  }

                  await model.refresh();
                },
                children: [
                  for(final props in model.cached)
                    CardEditor(
                        props: props,
                        key: ValueKey(props.id)
                    )
                ]
            );
          }
      );

}
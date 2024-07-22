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
          builder: (context, model, child) =>
              ReorderableListView(
                  physics: const NeverScrollableScrollPhysics(),
                  proxyDecorator: proxyDecorator,
                  shrinkWrap: true,
                  onReorder: (e1, e2) async {

                    final Val(ok:swapOk, other:swapOther) = await swapCards(
                        model.cached[e1],
                        model.cached[e2]
                    );

                    if(swapOk == null) {
                      log(swapOther);
                      return;
                    }

                    await model.refreshCardList();

                  },
                  children: [
                    for(final props in model.cached)
                      CardEditor(
                          props: props,
                          key: ValueKey(props.id)
                      )
                  ]
              )
      );

}
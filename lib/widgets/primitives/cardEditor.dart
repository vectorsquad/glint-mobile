part of 'primitives.dart';

Future<void> Function(String) createParamSetterNewOnly(BuildContext context, Map<String, dynamic> params, String key, FlashCard props) {
  return (s) async {

    params[key] = s;

    final cardListNotifier = Provider.of<CardListNotifier>(
        context,
        listen: false
    );

    cardListNotifier.queueUpdate(props, params);

    cardListNotifier.refreshDelayed(
        duration: const Duration(seconds: 1),
        beforeRefresh: () async {
          await cardListNotifier.submitUpdates();
        }
    );

  };
}

class CardEditor extends StatelessWidget {

  final FlashCard props;
  final Key? key;
  final Map<String, dynamic> params = HashMap();

  CardEditor(
      {
        this.key,
        required this.props,
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    params["_id"] = props.id;
    return Card(
        child: Column(
          key: ValueKey(props.id),
          children: [
            Text(
              "Card ${props.deckIndex + 1}",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w900,
                color: lightColorScheme.primary,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormFieldC(
                      name: "Front Text",
                      initialValue: props.sideFront,
                      onChanged: createParamSetterNewOnly(
                          context, params, "side_front", props),
                      validator: flashCardFrontValidator,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldC(
                      name: "Back Text",
                      initialValue: props.sideBack,
                      onChanged: createParamSetterNewOnly(
                          context, params, "side_back", props),
                      validator: flashCardBackValidator,
                    ),
                    const SizedBox(
                      width: 20,
                      height: 20,
                    )

                  ],
                )
            )

          ],
        )
    );
  }

}

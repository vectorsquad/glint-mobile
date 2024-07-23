part of 'pages.dart';

class DeckEditor extends StatelessWidget {

  final Deck props;

  const DeckEditor({super.key, required this.props});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => DeckNotifier(props: props),
      child: PageBuilderRound(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Edit Deck',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: lightColorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Consumer<DeckNotifier>(
                  builder: (context, model, child) => TextFormFieldC(
                      name: "Deck Name",
                      initialValue: model.props.name,
                      onChanged: (s) {
                        model.setParam("name", s);
                        model.refreshDelayed(
                            beforeRefresh: () async {
                              await updateDeck(model.params);
                              await model.refresh();
                            },
                            duration: const Duration(seconds: 2)
                        );
                      },
                      validator: setNameValidator
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Divider(),
                Expanded(
                    child: Consumer<DeckNotifier>(
                        builder: (context, model, child) => CardEditorList(
                            props: model.props
                        )
                    )
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const AddCardButton()
              ],
            ),
      )
  );
}

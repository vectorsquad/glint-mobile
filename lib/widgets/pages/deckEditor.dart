part of 'pages.dart';

class DeckEditor extends StatelessWidget {

  final Deck props;

  const DeckEditor({super.key, required this.props});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => DeckNotifier(props: props),
      child: PageBuilderRound(
          child: SingleChildScrollView(
            child: Column(
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
                      name: "Set Name",
                      initialValue: model.props.name,
                      onChanged: (s) {
                        model.setParam("name", s);
                        model.refreshDelayed(
                            beforeRefresh: () async {
                              final Val(:ok, :other) = await updateDeck(model.params);
                              if(ok == null) {
                                log(other);
                              }

                              Provider.of<DeckListNotifier>(context).refreshDeckList();
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
                Consumer<DeckNotifier>(
                    builder: (context, model, child) => ChangeNotifierProvider(
                      create: (context) => CardListNotifier(
                        deckId: model.props.id,
                      ),
                      child: CardEditorList(
                          props: model.props
                      ),
                    )
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Consumer<DeckNotifier>(
                  builder: (context, model, child) => AddCardButton(
                      props: model.props
                  ),
                )
              ],
            ),
          )
      )
  );
}

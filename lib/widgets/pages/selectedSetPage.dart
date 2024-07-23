part of 'pages.dart';

class SelectedSetPage extends StatelessWidget {
  final Deck props;

  const SelectedSetPage({super.key, required this.props});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => DeckNotifier(props: props),
      child: PageBuilderRound(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<DeckNotifier>(
                builder: (context, model, child) => Text(
                      model.props.name,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: lightColorScheme.primary,
                      ),
                    )),
            const SizedBox(
              height: 30.0,
            ),
            Consumer<DeckNotifier>(
              builder: (context, deckNotifier, child) => ChangeNotifierProvider(
                create: (context) => CardListNotifier(props: deckNotifier.props),
                child: Consumer<CardListNotifier>(
                    builder: (context, cardListNotifier, child) => Column(
                      children: [
                        cardListNotifier.cached.isEmpty
                            ? const Text("No Cards Created")
                            : ChangeNotifierProvider(
                            create: (context) => CurrentCardNotifier(
                                cardList: cardListNotifier.cached,
                                card: cardListNotifier.cached[0]
                            ),
                            child: const Column(
                              children: [
                                CardViewer(),
                                SizedBox(height: 20.0),
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ChangeCardButton(isNext: false),
                                      ChangeCardButton(isNext: true),
                                    ])
                              ],
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                                onPressed: () async {
                                  await pushRoute(
                                      context,
                                      DeckEditor(props: props)
                                  );

                                  await deckNotifier.refresh();
                                  await cardListNotifier.refresh();
                                },
                                elevation: 2.0,
                                fillColor: lightColorScheme.primary,
                                padding: const EdgeInsets.all(15.0),
                                shape: const CircleBorder(),
                                child: const Icon(
                                  Icons.edit,
                                  size: 40.0,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
          )));
}

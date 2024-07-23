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
                            child: Column(
                              children: [
                                Consumer<CurrentCardNotifier>(
                                    builder: (context, currentCard, child) {
                                      final controller = FlipCardController();
                                      return FlipCard(
                                        fill: Fill.fillBack,
                                        side: CardSide.FRONT,
                                        direction: FlipDirection.HORIZONTAL,
                                        controller: controller,
                                        front: CardViewer(
                                            callback: controller.toggleCard,
                                            text: currentCard.card.sideFront ?? ""
                                        ),
                                        back: CardViewer(
                                            callback: controller.toggleCard,
                                            text: currentCard.card.sideBack ?? ""
                                        ),
                                      );
                                    }
                                ),
                                const SizedBox(height: 20.0),
                                const Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ChangeCardButton(isNext: false),
                                      ChangeCardButton(isNext: true),
                                    ])
                              ],
                            )
                        ),
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

                                  log("refreshing current deck");
                                  log("refreshing current cards in deck");
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

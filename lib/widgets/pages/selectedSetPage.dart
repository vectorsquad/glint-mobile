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
                    builder: (context, model, child) =>
                        Text(
                          model.props.name,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                            color: lightColorScheme.primary,
                          ),
                        )
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Consumer<DeckNotifier>(
                  builder: (context, model, child) => ChangeNotifierProvider(
                    create: (context) => CardListNotifier(
                        deckId: model.props.id
                    ),
                    child: Consumer<CardListNotifier>(
                        builder: (context, model, child) => Column(
                          children: [
                            model.cached.isEmpty ?
                            const Text("No Cards Created") :
                            ChangeNotifierProvider(
                                create: (context) => CurrentCardNotifier(
                                    cardList: model.cached,
                                    card: model.cached[0]
                                ),
                                child: const Column(
                                  children: [
                                    CardViewer(),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ChangeCardButton(
                                              isNext: false
                                          ),
                                          ChangeCardButton(
                                              isNext: true
                                          ),
                                        ]
                                    )
                                  ],
                                )
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                EditDeckButton(
                                    props: props
                                )
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
          )
      )
  );

}

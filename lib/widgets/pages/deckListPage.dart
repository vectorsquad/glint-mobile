part of 'pages.dart';

class DeckListPage extends StatelessWidget {
  const DeckListPage({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => DeckListNotifier()),
            ChangeNotifierProvider(create: (_) => CheckedCountNotifier())
          ],
          child: PageBuilderRound(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
// get started text
                  Text(
                    'Deck List',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: lightColorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Expanded(
                    child: DeckListViewer(),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Consumer<DeckListNotifier>(
                      builder: (context, deckList, child) => Consumer<CheckedCountNotifier>(
                        builder: (context, checkedCount, child) => CircleButton(
                            icon: checkedCount.none ?
                            Icons.add :
                            Icons.delete_forever,
                            fillColor: checkedCount.none ?
                            Colors.green :
                            Colors.pink,
                            onPressed: () async {

                              if(checkedCount.none) {
                                await pushRoute(context, const AddDeckRoute());
                                await deckList.refresh();
                                return;
                              }

                              await deckList.submitDelete();
                              checkedCount.reset();

                            }
                        ),
                      )
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // sign up divider
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await deleteAuthCache();
                          await replaceRouteAll(context, const WelcomeRoute());
                        },
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: lightColorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
          )
  );
}

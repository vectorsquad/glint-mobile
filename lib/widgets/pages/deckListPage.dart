part of 'pages.dart';

class DeckListPage extends StatelessWidget {
  const DeckListPage({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => DeckListNotifier()),
            ChangeNotifierProvider(create: (_) => ShowCheckboxNotifier())
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
                      builder: (context, deckListModel, child) => Consumer<ShowCheckboxNotifier>(
                        builder: (context, showCheckboxModel, child) => CircleButton(
                            icon: showCheckboxModel.checked == 0 ?
                            Icons.add :
                            Icons.delete_forever,
                            fillColor: showCheckboxModel.checked == 0 ?
                            Colors.green :
                            Colors.pink,
                            onPressed: () async {

                              log("${showCheckboxModel.checked}");

                              if(showCheckboxModel.checked == 0) {
                                await pushRoute(context, const AddDeckRoute());
                                await deckListModel.refresh();
                                return;
                              }

                              await deckListModel.submitDelete();

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

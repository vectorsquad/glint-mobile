part of 'pages.dart';

class DeckListPage extends StatelessWidget {
  const DeckListPage({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (_) => DeckListNotifier(),
      child: PageBuilderRound(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
// get started text
              Text(
                'Your Sets',
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
                  child: (
                      SingleChildScrollView(
                        child: DeckListViewer(),
                      )
                  )
              ),
              const SizedBox(
                height: 20.0,
              ),
              Consumer<DeckListNotifier>(
                builder: (context, model, child) => CircleButton(
                    onPressed: () async {
                      await pushRoute(context, const AddDeckRoute());
                      await model.refresh();
                    }
                ),
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

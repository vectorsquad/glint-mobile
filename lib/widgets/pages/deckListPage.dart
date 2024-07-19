part of 'pages.dart';

class DeckListPage extends StatelessWidget {
  const DeckListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(
            height: 10,
          ),
        ),
        Expanded(
          flex: 100,
          child: Container(
            padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: SingleChildScrollView(
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
                  const DeckListViewer(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CircleButton(
                    onPressed: () => pushRoute(context, const AboutUsRoute()),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
// sign up divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
// Navigator.push(context, MaterialPageRoute(
//    builder: (e) => const MainScreen(),
//  ),
                        },
                        child: Text(
                          'View all sets',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: lightColorScheme.primary,
                          ),
                        ),

                      ),
                    ],
                  ),
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
              ,
            ),
          ),
        ),
      ],
    );
  }

}
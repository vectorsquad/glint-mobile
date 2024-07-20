part of 'routes.dart';

void submitSignInFirstRun() async {
  setupDio();
  submitSignin({});
}

class ExhaustiveLoginRoute extends StatelessWidget {
  const ExhaustiveLoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: FutureBuilder(
            future: setupDio(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const LoadingPage();
              }

              return FutureBuilder(
                  future: submitSignin({}),
                  builder: (context, snapshot) {
                    // If sign-in request is finished...
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If able to sign-in, change default widget to deck list.
                      if (snapshot.data?.ok != null) {
                        return const DeckListPage();
                      }

                      // Only here if unable to sign-in with JWT authentication.
                      return const WelcomePage();
                    }

                    // Only here if sign-in request is not finished.
                    return const LoadingPage();
                  });
            }));
  }
}

part of '../routes.dart';

class ExhaustiveLoginRoute extends StatelessWidget {
  const ExhaustiveLoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: FutureBuilder(
            future: submitSignin({}),
            builder: (context, snapshot) {

              // If sign-in request is finished...
              if(snapshot.connectionState == ConnectionState.done) {

                // If able to sign-in, change default widget to deck list.
                if(snapshot.data?.ok != null) {
                  return const DeckListPage();
                }

                // Only here if unable to sign-in.
                return const WelcomePage();

              }

              // Only here if sign-in request is not finished.
              return const CircularProgressIndicator();

            }
        )
    );
  }

}
part of '../pages.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final _formSignInKey = GlobalKey<FormState>();
  final Map<String, dynamic> params = {};

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
          flex: 7,
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
              child: Form(
                key: _formSignInKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w900,
                        color: lightColorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: lightColorScheme.shadow,
                      ),
                    ),
                    Text(
                      'Log in to view your flashcards.',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: lightColorScheme.shadow,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextFormFieldC(
                        name: "Username",
                        onChanged: newParamSetter(params, "username"),
                        validator: usernameValidator
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormFieldC(
                        name: "Password",
                        onChanged: newParamSetter(params, "password_hash"),
                        validator: passwordValidator,
                        obscure: true
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Text(
                            'Forgot password?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {

                            // Return early if form is not valid.
                            if(!validForm(_formSignInKey)) {
                              return;
                            }

                            // Submit form.
                            final Val(:ok, :other) = await submitSignin(params);

                            // Alert user if no "ok" value and return early.
                            if(ok == null) {
                              await QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  text: other
                              );
                              // return;
                            }

                            // Navigate to list of decks.
                            await replaceRoute(context, const DeckListScreen());

                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: lightColorScheme.primary,
                              textStyle: const TextStyle(
                                  fontSize: 18
                              )
                          ),
                          child: const Text('Submit')
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    // don't have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (e) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign up here',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
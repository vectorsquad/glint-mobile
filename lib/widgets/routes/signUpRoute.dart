part of 'routes.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formSignupKey = GlobalKey<FormState>();
  final Map<String, dynamic> params = {};

  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
      child: Column(
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
                // get started form
                child: Form(
                  key: _formSignupKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // get started text
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormFieldC(
                          name: "First Name",
                          onChanged: newParamSetter(params, "name_first"),
                          validator:  firstNameValidator
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormFieldC(
                          name: "Last Name",
                          onChanged: newParamSetter(params, "name_last"),
                          validator:  lastNameValidator
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormFieldC(
                          name: "Email",
                          onChanged: newParamSetter(params, "email"),
                          validator: emailValidator
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormFieldC(
                          name: "Username",
                          onChanged: newParamSetter(params, "username"),
                          validator: usernameValidator,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormFieldC(
                          name: "Password",
                          onChanged: newParamSetter(params, "password_hash"),
                          validator:  passwordValidator,
                          obscure: true
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {

                            // Return early if form is not valid
                            if(!validForm(_formSignupKey)) {
                              return;
                            }

                            // Submit sign up data
                            final Val(:ok, :other) = await submitSignup(params);

                            // Alert user if no "ok" value and return early.
                            if(ok == null) {
                              await QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  text: other
                              );
                              return;
                            }

                            // Tell user to check their email
                            await QuickAlert.show(
                                context: context,
                                type: QuickAlertType.info,
                                text: "Check Email For Verification"
                            );

                            // Navigate to sign in screen
                            await replaceRoute(context, const VerifyRoute());

                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: lightColorScheme.primary,
                              textStyle: const TextStyle(
                                  fontSize: 18
                              )
                          ),
                          child: const Text('Submit'),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up divider
                      const SizedBox(
                        height: 25.0,
                      ),
                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign In',
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
      ),
    );
  }
}
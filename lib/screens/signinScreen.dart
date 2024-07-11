import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:login_signup/screens/mainScreen.dart';
import 'package:login_signup/screens/signupScreen.dart';
import 'package:login_signup/scripts/util.dart';
import 'package:login_signup/scripts/validation.dart';
import 'package:login_signup/widgets/customScaffold.dart';
import 'package:login_signup/widgets/textFormField.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../scripts/signin.dart';
import '../theme/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

final paramControllers = newFieldControllers(params);

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
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
                          "Username",
                          "username",
                          paramControllers,
                          usernameValidator
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormFieldC(
                          "Password",
                          "password_hash",
                          paramControllers,
                          passwordValidator,
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

                              // Return early if form is not valid
                              if(!validForm(_formSignInKey)!) {
                                return;
                              }

                              // For each text controller...
                              for(final tc in textControllers.entries) {
                                // Assign key in request params to user input
                                params[tc.key] = tc.value.text;
                              }

                              // Return early if unable to sign in
                              final res = await submit();
                              if(res != null) {
                                await QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    text: jsonEncode(res.data)
                                );
                                return;
                              }

                              // Navigate to user's main screen
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (
                                          (ctx) => const MainScreen()
                                  ))
                              );

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: lightColorScheme.primary,
                                textStyle: const TextStyle(
                                    fontSize: 18
                                )
                            ),
                            child: const Text('Sign In')
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignUpScreen(),
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
      ),
    );
  }
}
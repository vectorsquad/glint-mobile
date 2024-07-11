import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login_signup/screens/signinScreen.dart';
import 'package:login_signup/scripts/signup.dart';
import 'package:login_signup/scripts/util.dart';
import 'package:login_signup/scripts/validation.dart';
import 'package:login_signup/theme/theme.dart';
import 'package:login_signup/widgets/customScaffold.dart';
import 'package:quickalert/quickalert.dart';

import '../widgets/textFormField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool? validForm(GlobalKey<FormState> form) => form.currentState?.validate();

final textControllers = newFieldControllers(paramsSignup);

String? defaultValidator(String? s) {
  return null;
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

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
                      // first name
                      TextFormFieldC("First Name", "name_first", textControllers, firstNameValidator),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // last name
                      TextFormFieldC("Last Name", "name_last", textControllers, lastNameValidator),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // username
                      TextFormFieldC("Username", "username", textControllers, usernameValidator),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // email
                      TextFormFieldC("Email", "email", textControllers, emailValidator),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // password
                      TextFormFieldC("Password", "password_hash", textControllers, passwordValidator, obscure: true),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {

                            // Return early if form is not valid
                            if(!validForm(_formSignupKey)!) {
                              return;
                            }

                            // For each text controller...
                            for(final tc in textControllers.entries) {
                              // Assign key in request params to user input
                              paramsSignup[tc.key] = tc.value.text;
                            }

                            await submitSignupForm();
                            await QuickAlert.show(context: context, type: QuickAlertType.info, text: "Check Email For Verification");
                            Navigator.pop(context);

                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: lightColorScheme.primary,
                              textStyle: const TextStyle(
                                  fontSize: 18
                              )
                          ),
                          child: const Text('Sign up'),
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
                              'Sign in',
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
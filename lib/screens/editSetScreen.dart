import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:login_signup/screens/mainScreen.dart';
import 'package:login_signup/screens/selectedSetScreen.dart';
import 'package:login_signup/theme/theme.dart';
import 'package:login_signup/widgets/customScaffold.dart';

class EditSetScreen extends StatefulWidget {
  const EditSetScreen({super.key});

  @override
  State<EditSetScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<EditSetScreen> {
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
                // get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Edit Set',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter card #';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Card #'),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100.0,
                            height: 70.0,
                            child: ElevatedButton(
                              onPressed: () {
                                // SET 1 HERE
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: lightColorScheme.tertiary,
                                textStyle: const TextStyle(
                                  fontSize: 14
                                )
                              ),
                              child: const Icon(
                                Icons.chevron_left,
                                size: 35.0,
                                color: Colors.white,
                              )
                            ),
                          ),
                          SizedBox(
                            width: 100.0,
                            height: 70.0,
                            child: ElevatedButton(
                              onPressed: () {
                                // SET 1 HERE
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: lightColorScheme.tertiary,
                                textStyle: const TextStyle(
                                  fontSize: 14
                                )
                              ),
                              child: const Icon(
                                Icons.chevron_right,
                                size: 35.0,
                                color: Colors.white,
                              )
                            ),
                          ),
                        ]
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter front note card text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Front Text'),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter back note card text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Back Text'),
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 180.0,
                        height: 60.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // SET 1 HERE
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: lightColorScheme.tertiary,
                              textStyle: const TextStyle(
                                  fontSize: 24
                              )
                          ),
                          child: const Text('Save Card'),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (e) => const SelectedSetScreen(),
                                  )
                              );
                            },
                            child: Text(
                              'Back to set',
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
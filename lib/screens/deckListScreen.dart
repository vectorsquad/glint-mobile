import 'package:flutter/material.dart';
import 'package:login_signup/models/deckListModel.dart';
import 'package:login_signup/screens/welcomeScreen.dart';
import 'package:login_signup/theme/theme.dart';
import 'package:login_signup/widgets/customScaffold.dart';
import 'package:login_signup/widgets/deckBox.dart';
import 'package:login_signup/widgets/deckViewer.dart';
import 'package:provider/provider.dart';

class DeckListScreen extends StatelessWidget {

  const DeckListScreen({super.key});

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
                    RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: lightColorScheme.primary,
                        padding: const EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.add,
                          size: 35.0,
                          color: Colors.white,
                        )
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (e) => const WelcomeScreen(),
                                )
                            );
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
      ),
    );

  }
}

import 'package:flutter/material.dart';
import 'package:login_signup/screens/deckInfoScreen.dart';
import 'package:login_signup/scripts/util.dart';

import '../theme/theme.dart';

class DeckProps {
}

class DeckBox extends StatelessWidget {
  final HttpProps props;

  const DeckBox(this.props, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140.0,
      child: ElevatedButton(
        onPressed: () async {

          // Go to deck's info screen
          await nextRoute(context, DeckInfo(props));

        },
        style: ElevatedButton.styleFrom(
            backgroundColor: lightColorScheme.tertiary,
            textStyle: const TextStyle(
                fontSize: 24
            )
        ),
        child: Text(props["name"]),
      ),
    );
  }
}
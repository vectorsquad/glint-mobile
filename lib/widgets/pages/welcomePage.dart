part of 'pages.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            flex: 8,
            child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: 'Glint.\n',
                              style: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w600,
                              )),
                          TextSpan(
                              text: '\nA tool kit to enhance learning',
                              style: TextStyle(
                                fontSize: 20,
                                // height: 0,
                              ))
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () => pushRoute(
                            context, const RouteBuilder(child: ApiUrlEditor())),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                            ),
                            child: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            onPressed: () => pushRoute(context,
                                const RouteBuilder(child: ApiUrlEditor()))))
                  ],
                ))),
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                const Expanded(
                  child: WelcomeButton(
                    buttonText: 'Sign in',
                    onTap: SignInScreen(),
                    color: Colors.transparent,
                    textColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: WelcomeButton(
                    buttonText: 'Sign up',
                    onTap: SignUpScreen(),
                    color: Colors.white,
                    textColor: lightColorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

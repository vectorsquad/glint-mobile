part of 'routes.dart';

class AboutUsRoute extends StatelessWidget {
  const AboutUsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final formSignupKey = GlobalKey<FormState>();
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
                  key: formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Alan Phan',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.shadow,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'PM / Mobile App',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            'Jonathan Alonso',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.shadow,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'DB / Mobile App',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            'Rodrigo Costa',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.shadow,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'API',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            'Noah Issacson',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.shadow,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'API',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            'Joseph Simon',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.shadow,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Web App',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            'Jacob McKiernan',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.shadow,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Web App',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            'Corey Swafford',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.shadow,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Web App',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          )
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
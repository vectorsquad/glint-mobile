part of 'routes.dart';

class SelectedSetScreen extends StatelessWidget {
  const SelectedSetScreen({super.key});

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
                      // get started text
                      Text(
                        'SET NAME',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 420.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // FLIP CARD
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: lightColorScheme.tertiary,
                              textStyle: const TextStyle(
                                  fontSize: 24
                              )
                          ),
                          child: const Text('Card 1'),
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
                                    // PREV CARD
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: lightColorScheme.primary,
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
                            RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                        builder: (e) => const EditSetScreen(),
                                      )
                                  );
                                },
                                elevation: 2.0,
                                fillColor: lightColorScheme.primary,
                                padding: const EdgeInsets.all(15.0),
                                shape: const CircleBorder(),
                                child: const Icon(
                                  Icons.edit,
                                  size: 40.0,
                                  color: Colors.white,
                                )
                            ),
                            SizedBox(
                              width: 100.0,
                              height: 70.0,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: lightColorScheme.primary,
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
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (e) => const Text("lmao"),
                                  )
                              );
                            },
                            child: Text(
                              'Start studying',
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
                        height: 40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (e) => const Text("lmao"),
                                  )
                              );
                            },
                            child: Text(
                              'Back to sets',
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
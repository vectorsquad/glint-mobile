part of '../routes.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final _formSignInKey = GlobalKey<FormState>();
    final params = HashMap<String, dynamic>();

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
                        'Verify',
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
                        'Check Email For Verification Code.',
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
                          name: "Code",
                          onChanged: newParamSetter(params, "code"),
                          validator: codeValidator
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

                              final code = params["code"];
                              if(code == null) {
                                await QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    text: "Cannot retrieve typed verification code."
                                );
                                return;
                              }

                              // Submit form.
                              final Val(:ok, :other) = await submitVerification(code);

                              // Alert user if no "ok" value and return early.
                              if(ok == null) {
                                await QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    text: other
                                );
                                return;
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
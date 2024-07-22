part of 'routes.dart';

class AddDeckRoute extends StatelessWidget {
  const AddDeckRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> params = HashMap();
    final formSignupKey = GlobalKey<FormState>();

    return PageBuilderRound(
        child: Form(
          key: formSignupKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Deck',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  color: lightColorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormFieldC(
                name: "Deck Name",
                onChanged: newParamSetter(params, "name"),
                validator: deckNameValidator,
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        log(jsonEncode(params));

                        final Val(:ok, :other) = await createDeck(params);
                        if (ok == null) {
                          await QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: other,
                          );
                          return;
                        }

                        Provider.of<DeckListNotifier>(context, listen: false)
                            .refreshDeckList();

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: lightColorScheme.tertiary,
                          textStyle: const TextStyle(fontSize: 24)),
                      child: const Text('Save'),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
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
        )
    );
  }
}

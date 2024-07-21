part of 'pages.dart';

class EditDeckPage extends StatelessWidget {

  final DeckModel props;

  const EditDeckPage({required this.props, super.key});

  @override
  Widget build(BuildContext context) {
    final formSignupKey = GlobalKey<FormState>();
    return Form(
      key: formSignupKey,
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
                return 'Please enter set name';
              }
              return null;
            },
            decoration: InputDecoration(
              label: Text(props.name),
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
          Consumer<CardListNotifier>(
            builder: (context, model, child) {
              final flashCardEditors = <Widget>[];


              for (var i = 0; i < model.cached.length; i++) {
                final deckProp = model.cached[i];
                flashCardEditors.add(
                    FlashCardEditor(
                    props: deckProp,
                )
                );

                // Add spacer if more items
                if (i + 1 < model.cached.length) {
                  const spacer = SizedBox(width: 20, height: 20);
                  flashCardEditors.add(spacer);
                }
              }

              return Column(children: flashCardEditors);
            }
          ),
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
              )),
          const SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: 180.0,
            height: 60.0,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: lightColorScheme.tertiary,
                  textStyle: const TextStyle(fontSize: 24)),
              child: const Text('Save Set'),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (e) => RouteBuilder(
                              child: SelectedSetPage(
                                  props: props
                              )
                          )
                      ));
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
    );
  }

}



part of 'pages.dart';

class DeckEditor extends StatelessWidget {
  final Deck props;

  const DeckEditor({required this.props, super.key});

  @override
  Widget build(BuildContext context) {
    final formSignupKey = GlobalKey<FormState>();
    return PageBuilderRound(
        child: ChangeNotifierProvider(
            create: (context) => CardListNotifier(deckId: props.id),
            child: Form(
                key: formSignupKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Edit Deck',
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
                          name: "Set Name",
                          initialValue: props.name,
                          onChanged: newParamSetter({}, ""),
                          validator: setNameValidator),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Divider(),
                      CardEditorList(props: props),
                      const SizedBox(
                        height: 20.0,
                      ),
                      AddCardButton(
                          props: props
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
                                          child: SelectedSetPage(props: props)
                                      )
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
                )
            )
        )
    );
  }
}

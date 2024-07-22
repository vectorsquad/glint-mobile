part of 'pages.dart';

class EditDeckPage extends StatelessWidget {
  final Deck props;

  const EditDeckPage({required this.props, super.key});

  @override
  Widget build(BuildContext context) {
    final formSignupKey = GlobalKey<FormState>();
    return ChangeNotifierProvider(
        create: (context) => CardListNotifier(props.id),
        child: Form(
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
              TextFormFieldC(
                  name: "Set Name",
                  initialValue: props.name,
                  onChanged: newParamSetter({}, ""),
                  validator: setNameValidator),
              const SizedBox(
                height: 20.0,
              ),
              Consumer<CardListNotifier>(builder: (context, model, child) {
                final children = <Widget>[];

                for (var props in model.cached) {
                  children.add(FlashCardEditor(props: props));
                }

                return ReorderableListView(
                    onReorder: (e1, e2) {
                      log("$e1}");
                      log("$e2}");
                    },
                    children: children
                );
              }),
              const SizedBox(
                height: 20.0,
              ),
              Consumer<CardListNotifier>(
                  builder: (context, model, child) => RawMaterialButton(
                      onPressed: () async {
                        final val = await createCardEmpty(props.id);

                        if (val.ok == null) {
                          await alertVal(val, context);
                          return;
                        }

                        context
                            .read<CardListNotifier>()
                            .refreshCardList(props.id);
                      },
                      elevation: 2.0,
                      fillColor: lightColorScheme.primary,
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.add,
                        size: 35.0,
                        color: Colors.white,
                      ))),
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
                                  child: SelectedSetPage(props: props))));
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
        ));
  }
}

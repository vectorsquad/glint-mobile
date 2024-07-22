part of 'primitives.dart';

class AddCardButton extends StatelessWidget {
  final Deck props;

  const AddCardButton({required this.props, super.key});

  @override
  Widget build(BuildContext context) =>
      Consumer<CardListNotifier>(
          builder: (context, model, child) => RawMaterialButton(
              onPressed: () async {
                final val = await createCardEmpty(props.id);

                if (val.ok == null) {
                  await alertVal(val, context);
                  return;
                }

                model.refreshCardList();

              },
              elevation: 2.0,
              fillColor: lightColorScheme.primary,
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                size: 35.0,
                color: Colors.white,
              )
          )
      );

}
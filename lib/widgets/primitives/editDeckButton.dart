part of 'primitives.dart';

class EditDeckButton extends StatelessWidget {

  final Deck props;

  const EditDeckButton({required this.props, super.key});

  @override
  Widget build(BuildContext context) => RawMaterialButton(
      onPressed: () async {
        await pushRoute(
            context,
            DeckEditor(
                props: props
            )
        );

        await Provider.of<DeckNotifier>(
            context
        ).refresh();

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
  );

}
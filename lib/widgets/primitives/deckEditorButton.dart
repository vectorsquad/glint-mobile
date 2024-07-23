
part of 'primitives.dart';

class DeckEditorButton extends StatelessWidget {

  final Deck props;

  const DeckEditorButton({required this.props, super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RawMaterialButton(
          onPressed: () async {
            await pushRoute(
                context,
                DeckEditor(props: props)
            );

            log("refreshing current deck");
            log("refreshing current cards in deck");

            await Provider.of<DeckNotifier>(context, listen: false).refresh();
            await Provider.of<CardListNotifier>(context, listen: false).refresh();
          },
          elevation: 2.0,
          fillColor: lightColorScheme.primary,
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.edit,
            size: 40.0,
            color: Colors.white,
          ))
    ],
  );

}
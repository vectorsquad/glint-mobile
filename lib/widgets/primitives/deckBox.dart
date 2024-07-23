part of 'primitives.dart';

class DeckProps {}

class DeckBox extends StatelessWidget {
  final Deck props;

  const DeckBox(this.props, {super.key});

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider(
          create: (context) => DeckNotifier(props: props),
          child: SizedBox(
            width: double.infinity,
            height: 140.0,
            child: ElevatedButton(
              onPressed: () async {
                await pushRoute(
                    context,
                    SelectedSetPage(props: props)
                );
                await Provider.of<DeckListNotifier>(context, listen: false).refresh();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: lightColorScheme.tertiary,
                  textStyle: const TextStyle(fontSize: 24)),
              child: Text(props.name),
            ),
          )
      );

}

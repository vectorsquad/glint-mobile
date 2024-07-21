part of 'primitives.dart';

class DeckProps {}

class DeckBox extends StatelessWidget {
  final Deck props;

  const DeckBox(this.props, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140.0,
      child: ElevatedButton(
        onPressed: () async {
          // Go to deck's info screen
          await pushRoute(context, SelectedSetRoute(props: props));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: lightColorScheme.tertiary,
            textStyle: const TextStyle(fontSize: 24)),
        child: Text(props.name),
      ),
    );
  }
}

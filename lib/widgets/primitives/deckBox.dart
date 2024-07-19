part of 'primitives.dart';

class DeckProps {
}

class DeckBox extends StatelessWidget {
  final DeckModel props;

  const DeckBox(this.props, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140.0,
      child: ElevatedButton(
        onPressed: () async {

          // Go to deck's info screen
          await replaceRoute(context, const EditSetScreen());

        },
        style: ElevatedButton.styleFrom(
            backgroundColor: lightColorScheme.tertiary,
            textStyle: const TextStyle(
                fontSize: 24
            )
        ),
        child: Text(props.name),
      ),
    );
  }
}
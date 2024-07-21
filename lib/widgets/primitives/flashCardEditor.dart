part of 'primitives.dart';

class FlashCardEditor extends StatelessWidget {
  const FlashCardEditor({
    super.key,
    required this.props,
  });

  final FlashCard props;

  @override
  Widget build(BuildContext context) {
    return Card(
        key: ValueKey(props.id),
        child: Column(
          children: [
            Text(
              "Card ${props.deck_index}",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w900,
                color: lightColorScheme.primary,
              ),
            ),
            TextFormFieldC(
              name: "Front Text",
              onChanged: (s) {},
              validator: flashCardFrontValidator,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormFieldC(
              name: "Back Text",
              onChanged: (s) {},
              validator: flashCardBackValidator,
            )
          ],
        ));
  }
}

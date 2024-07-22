part of 'primitives.dart';

class CardEditor extends StatelessWidget {
  CardEditor({
    required this.props,
    this.key
  }) : super(key: key);

  final FlashCard props;
  final Key? key;
  final Map<String, dynamic> params = HashMap();

  @override
  Widget build(BuildContext context) =>
      Card(
          child: Column(
            key: ValueKey(props.id),
            children: [
              Text(
                "Card ${props.deckIndex + 1}",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w900,
                  color: lightColorScheme.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormFieldC(
                        name: "Front Text",
                        initialValue: props.sideFront,
                        onChanged: newParamSetter(params, "side_front"),
                        validator: flashCardFrontValidator,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldC(
                        name: "Back Text",
                        initialValue: props.sideBack,
                        onChanged: newParamSetter(params, "side_back"),
                        validator: flashCardBackValidator,
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                      )

                    ],
                  )
              )

            ],
          )
      );

}

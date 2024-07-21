part of 'pages.dart';

class SelectedSetPage extends StatelessWidget {
  const SelectedSetPage({required this.props, super.key});

  final Deck props;

  @override
  Widget build(BuildContext context) {
    final formSignupKey = GlobalKey<FormState>();
    return PageBuilderRound(
        child: SingleChildScrollView(
            child: Form(
      key: formSignupKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'SET NAME',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              color: lightColorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 420.0,
            child: ElevatedButton(
              onPressed: () {
// FLIP CARD
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: lightColorScheme.tertiary,
                  textStyle: const TextStyle(fontSize: 24)),
              child: const Text('Card 1'),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
              width: 100.0,
              height: 70.0,
              child: ElevatedButton(
                  onPressed: () {
// PREV CARD
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: lightColorScheme.primary,
                      textStyle: const TextStyle(fontSize: 14)),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 35.0,
                    color: Colors.white,
                  )),
            ),
            RawMaterialButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RouteBuilder(
                          child: SingleChildScrollView(
                              child: EditDeckPage(props: props))),
                    )),
                elevation: 2.0,
                fillColor: lightColorScheme.primary,
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.edit,
                  size: 40.0,
                  color: Colors.white,
                )),
            SizedBox(
              width: 100.0,
              height: 70.0,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: lightColorScheme.primary,
                      textStyle: const TextStyle(fontSize: 14)),
                  child: const Icon(
                    Icons.chevron_right,
                    size: 35.0,
                    color: Colors.white,
                  )),
            ),
          ]),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (e) => const Text("not implemented"),
                      ));
                },
                child: Text(
                  'Start studying',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: lightColorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    )));
  }
}

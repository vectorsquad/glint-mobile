
part of 'primitives.dart';

class CardViewer extends StatelessWidget {

  final String text;
  final Function() callback;

  const CardViewer({required this.callback, required this.text, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 350.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: lightColorScheme.tertiary,
              textStyle: const TextStyle(fontSize: 24)),
          onPressed: callback,
          child: Text(text),
        )
  );

}
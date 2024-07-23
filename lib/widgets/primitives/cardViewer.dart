
part of 'primitives.dart';

class CardViewer extends StatelessWidget {
  const CardViewer({super.key});

  @override
  Widget build(BuildContext context) => Consumer<CurrentCardNotifier>(
      builder: (context, model, child) => SizedBox(
        width: double.infinity,
        height: 420.0,
        child: ElevatedButton(
          onPressed: model.toggleText,
          style: ElevatedButton.styleFrom(
              backgroundColor: lightColorScheme.tertiary,
              textStyle: const TextStyle(fontSize: 24)),
          child: Text(model.text),
        ),
      )
  );

}
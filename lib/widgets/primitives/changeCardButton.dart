
part of 'primitives.dart';

class ChangeCardButton extends StatelessWidget {

  final bool isNext;

  const ChangeCardButton({required this.isNext, super.key});

  @override
  Widget build(BuildContext context) =>
      Consumer<CurrentCardNotifier>(
          builder: (context, model, child) =>
              SizedBox(
                width: 100.0,
                height: 70.0,
                child: ElevatedButton(
                    onPressed: isNext ? model.next : model.prev,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: lightColorScheme.primary,
                        textStyle: const TextStyle(fontSize: 14)),
                    child: Icon(
                      isNext ? Icons.chevron_right : Icons.chevron_left,
                      size: 35.0,
                      color: Colors.white,
                    )),
              )
      );
}
part of 'primitives.dart';

void doNothing() {}

class CircleButton extends StatelessWidget {
  const CircleButton({
    this.icon = Icons.add,
    this.fillColor = Colors.green,
    required this.onPressed,
    super.key,
  });

  final Function() onPressed;
  final IconData icon;
  final Color fillColor;

  @override
  Widget build(BuildContext context) => RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: fillColor,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: 35.0,
        color: Colors.white,
      ));
}

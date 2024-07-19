part of '../primitives.dart';

void doNothing() {
}

class CircleButton extends StatelessWidget {
  const CircleButton(
      {
        this.icon = Icons.add,
        required this.onPressed,
        super.key,
      }
      );

  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) => RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: lightColorScheme.primary,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: 35.0,
        color: Colors.white,
      )
  );

}
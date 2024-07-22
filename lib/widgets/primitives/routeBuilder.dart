part of 'primitives.dart';

class RouteBuilder extends StatelessWidget {
  final Widget child;

  const RouteBuilder({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
            child: child,
    );
  }
}

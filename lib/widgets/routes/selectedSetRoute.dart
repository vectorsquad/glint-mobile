part of 'routes.dart';

class SelectedSetRoute extends StatelessWidget {

  const SelectedSetRoute({required this.props, super.key});

  final DeckModel props;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SelectedSetPage(
          props: props
      )
    );
  }
}









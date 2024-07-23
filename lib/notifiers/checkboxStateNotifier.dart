part of 'notifiers.dart';

class CheckboxStateNotifier extends ChangeNotifier {
  bool _enabled = false;

  bool get enabled => _enabled;

  void toggle() {
    _enabled = !_enabled;
    notifyListeners();
  }

}
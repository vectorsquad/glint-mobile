part of 'notifiers.dart';

class CheckedStateNotifier extends ChangeNotifier {
  bool _checked = false;

  bool get checked => _checked;

  void toggle(Function(bool) callback) {
    _checked = !_checked;
    callback(_checked);
    notifyListeners();
  }

}
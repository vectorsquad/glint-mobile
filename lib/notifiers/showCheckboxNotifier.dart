
part of 'notifiers.dart';

class ShowCheckboxNotifier extends ChangeNotifier {
  bool _showCheckbox = false;
  int _totalChecked = 0;

  bool get showCheckbox => _showCheckbox;
  int get checked => _totalChecked;

  void incrementChecked() => _totalChecked += 1;
  void decrementChecked() => _totalChecked -= 1;

  void mutateChecked(bool increment) => _totalChecked = increment ? _totalChecked+1 : _totalChecked-1;

  void toggle() {
    _showCheckbox = !_showCheckbox;
    notifyListeners();
  }

  void show() {
    _showCheckbox = true;
    notifyListeners();
  }

  void hide() {
    _showCheckbox = false;
    notifyListeners();
  }

}
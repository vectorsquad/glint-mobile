
part of 'notifiers.dart';

class CheckedCountNotifier extends ChangeNotifier {
  int _totalChecked = 0;

  int get total => _totalChecked;

  set mutate(bool increment) {
    _totalChecked = increment ? _totalChecked + 1 : _totalChecked - 1;
    notifyListeners();
  }

  get none => _totalChecked == 0;

}
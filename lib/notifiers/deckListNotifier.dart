part of 'notifiers.dart';

// abstract class Serializable {
//   this Function(Map<String, dynamic>) fromJson;
// }

class DeckListNotifier extends ChangeNotifier {
  List<Deck> _cache = [];

  DeckListNotifier() {
    refreshDeckList();
  }

  UnmodifiableListView<Deck> get cached => UnmodifiableListView(_cache);

  void refreshDeckList() async {
    final Val(:ok) = await getList(getDeckList, DeckMapper.fromMap);
    if (ok == null) {
      return;
    }

    _cache = ok;
    notifyListeners();
  }
}

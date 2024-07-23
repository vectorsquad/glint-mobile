part of 'notifiers.dart';

// abstract class Serializable {
//   this Function(Map<String, dynamic>) fromJson;
// }

class DeckListNotifier extends ChangeNotifier {
  List<Deck> _cache = [];

  DeckListNotifier() {
    refresh();
  }

  UnmodifiableListView<Deck> get cached => UnmodifiableListView(_cache);

  Future<void> refresh() async {
    final Val(:ok) = await getList(getDeckList, DeckMapper.fromMap);
    if (ok == null) {
      return;
    }

    _cache = ok;
    notifyListeners();
  }
}

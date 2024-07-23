part of 'notifiers.dart';

// abstract class Serializable {
//   this Function(Map<String, dynamic>) fromJson;
// }

class DeckListNotifier extends ChangeNotifier {
  List<Deck> _cache = [];

  Map<String, Deck> _queuedForDelete = HashMap();

  void queueDelete(String key, Deck value) => _queuedForDelete[key] = value;
  void cancelDelete(String key) => _queuedForDelete.remove(key);
  void resetDelete() => _queuedForDelete = HashMap();

  Future<void> submitDelete() async {
    for(final props in _queuedForDelete.values) {

      final Val(:ok, :other) = await req(() => dio.post(
        apiUrl("deleteDeck"),
        data: {"_id": props.id}
      ));

      if(ok == null) {
        log(other);
      }
    }

    refresh();

  }

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
    resetDelete();
    notifyListeners();
  }
}

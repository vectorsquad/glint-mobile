part of 'notifiers.dart';

// abstract class Serializable {
//   this Function(Map<String, dynamic>) fromJson;
// }

class DeckListNotifier extends ChangeNotifier {
  List<Deck> _cache = [];

  Map<String, Deck> _queuedForDelete = HashMap();

  void cacheDelete(String key, Deck value) => _queuedForDelete[key] = value;

  void cancelDelete(String key) => _queuedForDelete.remove(key);

  void markDelete(bool delete, String key, Deck value) {
    if(delete) {
      cacheDelete(key, value);
    } else {
      cancelDelete(key);
    }
    notifyListeners();
  }

  void resetDelete() => _queuedForDelete = HashMap();

  Future<void> submitDelete() async {
    log("submitting queued deletes...");
    log("amount queued for deletion: ${_queuedForDelete.values.length}");
    for(final props in _queuedForDelete.values) {
      log("submitting queued deletes...");

      final Val(:ok, :other) = await req(() => dio.post(
        apiUrl("deleteDeck"),
        data: {"_id": props.id}
      ));
      log(other);
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

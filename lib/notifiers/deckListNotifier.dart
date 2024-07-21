part of 'notifiers.dart';

// abstract class Serializable {
//   this Function(Map<String, dynamic>) fromJson;
// }

class DeckListNotifier extends ChangeNotifier {
  List<DeckModel> _cache = [];

  DeckListNotifier() {
    refreshDeckList();
  }

  UnmodifiableListView<DeckModel> get cached => UnmodifiableListView(_cache);

  void refreshDeckList() async {
    final Val(:ok) = await getList(getDeckList, DeckModel.fromJson);
    if (ok == null) {
      return;
    }

    _cache = ok;
    notifyListeners();
  }
}

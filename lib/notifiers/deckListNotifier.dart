part of 'notifiers.dart';

Future<Val<List<DeckModel>, String>> getDeckList() async {
  final deckListVal = Val<List<DeckModel>, String>("");

  final Val(:ok, :other) = await getDecks();
  if (ok == null) {
    deckListVal.other = other;
    return deckListVal;
  }

  Iterable data = jsonDecode(ok.data);
  List<DeckModel> deckList = [];

  for(final deckObj in data) {
    deckList.add(DeckModel.fromJson(deckObj));
  }

  deckListVal.ok = deckList;

  return deckListVal;
}

class DeckListNotifier extends ChangeNotifier {
  List<DeckModel> _cache = [];

  UnmodifiableListView<DeckModel> get cached => UnmodifiableListView(_cache);

  void refreshDeckList() async {
    final Val(:ok, :other) = await getDeckList();
    if(ok == null) {
      return;
    }

    _cache = ok;
    notifyListeners();
  }
}

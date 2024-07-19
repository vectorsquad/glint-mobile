part of 'notifiers.dart';

Future<Val<DeckListModel, String>> getDeckList() async {

  final deckListVal = Val<DeckListModel, String>("");
  
  final Val(:ok, :other) = await getDecks();
  if(ok == null) {
    log(other);
    deckListVal.other = other;
    return deckListVal;
  }

  deckListVal.ok = DeckListModel.fromJson(ok.data);

  final lmao = deckListVal.ok?.decks;
  if(lmao != null) {
    log(jsonEncode(lmao));
  }

  return deckListVal;

}

class DeckListNotifier extends ChangeNotifier {
  var deckList = getDeckList();

  void refreshDeckList() {
    deckList = getDeckList();
    notifyListeners();
  }
}
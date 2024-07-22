part of 'notifiers.dart';

class CardListNotifier extends ChangeNotifier {
  List<FlashCard> _cache = [];

  UnmodifiableListView<FlashCard> get cached => UnmodifiableListView(_cache);

  CardListNotifier(String id_deck) {
    refreshCardList(id_deck);
  }

  void refreshCardList(String id_deck) async {
    ValRespFuture getCardListAll() => getCardList({"id_deck": id_deck});

    final Val(:ok) = await getList(getCardListAll, FlashCardMapper.fromMap);
    if (ok == null) {
      return;
    }

    _cache = ok;
    notifyListeners();
  }
}

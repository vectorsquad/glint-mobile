part of 'notifiers.dart';

class CardListNotifier extends ChangeNotifier {
  String deckId;
  List<FlashCard> _cache = [];
  UnmodifiableListView<FlashCard> get cached => UnmodifiableListView(_cache);

  CardListNotifier({required this.deckId}) {
    refreshCardList();
  }

  Future<void> refreshCardList() async {
    ValRespFuture getCardListAll() => getCardList({"id_deck": deckId});

    final Val(:ok) = await getList(getCardListAll, FlashCardMapper.fromMap);
    if (ok == null) {
      return;
    }

    _cache = ok;
    notifyListeners();
  }
}

part of 'notifiers.dart';

class CardListNotifier extends ChangeNotifier {
  List<CardModel> _cache = [];

  UnmodifiableListView<CardModel> get cached => UnmodifiableListView(_cache);

  void refreshCardList(String id_deck) async {

    ValRespFuture getCardListAll() => getCardList({
      "id_deck": id_deck
    });

    final Val(:ok) = await getList(getCardListAll, CardModel.fromJson);
    if (ok == null) {
      return;
    }

    _cache = ok;
    notifyListeners();
  }
}


part of 'notifiers.dart';

class CurrentCardNotifier extends ChangeNotifier {

  final List<FlashCard> cardList;
  FlashCard card;
  int idx = 0;
  String text = "";
  bool onFrontSide = true;

  CurrentCardNotifier(
      {
        required this.cardList,
        required this.card
      }
      ) {
    text = card.sideFront ?? "";
  }

  void _setCard() {
    card = cardList[idx];
    _setText(card.sideFront);
    onFrontSide = true;
  }

  void _setText(String? s ) => text = s ?? "";

  void toggleText() {

    for(final card in cardList) {
      log("${card.id}: ${card.sideFront}, ${card.sideBack}");
    }

    if(onFrontSide) {
      _setText(card.sideBack);
    } else {
      _setText(card.sideFront);
    }
    onFrontSide = !onFrontSide;
    notifyListeners();
  }

  void next() {
    if(idx+1 < cardList.length) {
      idx++;
      _setCard();
      notifyListeners();
    }
  }

  void prev() {
    if(idx-1 >= 0) {
      idx--;
      _setCard();
      notifyListeners();
    }
  }

}
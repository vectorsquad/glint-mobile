import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../scripts/global.dart';
import '../scripts/util.dart';

Future<List<HttpProps>> getDeckList() async {

  final userJwt = await getUserId();
  if(userJwt == null) {
    return [];
  }
  
  final Val(:ok, :other) = await req(() => dio.post(apiUrl("findDeck")));
  if(ok == null) {
    log(other);
    return [];
  }

  final decks = ok.data["decks"];
  if(decks == null) {
    return [];
  }

  return decks;

}

class DeckListModel extends ChangeNotifier {
  var deckList = getDeckList();

  void refreshDeckList() {
    deckList = getDeckList();
    notifyListeners();
  }
}
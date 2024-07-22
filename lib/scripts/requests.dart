import 'package:login_signup/models/models.dart';
import 'package:login_signup/scripts/util.dart';

import 'global.dart';

typedef RequestParams = Map<String, dynamic>;
typedef ValRespFuture = Future<ValResponse>;

ValRespFuture submitSignin(RequestParams? params) {
  return req(() => dio.post(apiUrl("login"), data: params));
}

ValRespFuture submitSignup(RequestParams params) {
  return req(() => dio.post(apiUrl("register"), data: params));
}

ValRespFuture submitVerification(String code) {
  return req(() => dio.get(apiUrl("verify"), queryParameters: {"code": code}));
}

ValRespFuture getDeckList() {
  return req(() => dio.post(apiUrl("findDeck")));
}

ValRespFuture getCardList(Map<String, dynamic> params) {
  return req(() => dio.post(apiUrl("find"), data: params));
}

ValRespFuture createDeck(RequestParams params) async {
  return req(() => dio.post(apiUrl("createDeck"), data: params));
}

ValRespFuture createCard(RequestParams params) async {
  return await req(() => dio.post(apiUrl("create"), data: params));
}

ValRespFuture createCardEmpty(String id_deck) async {
  return createCard({"id_deck": id_deck});
}

ValRespFuture updateCard(params) async {
  return req(() => dio.post(apiUrl("update"), data: params));
}

ValRespFuture swapCards(FlashCard firstCard, FlashCard secondCard) async {
  return await req(() => dio.post(apiUrl("swapCards"), data: {
    "card_first": {
      "_id": firstCard.id
    },
    "card_second": {
      "_id": secondCard.id
    }
  }));
}

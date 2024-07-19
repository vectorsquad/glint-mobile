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
  return req(() => dio.post(apiUrl("verify?code=$code")));
}

ValRespFuture getDecks() {
  return req(() => dio.post(apiUrl("findDeck")));
}

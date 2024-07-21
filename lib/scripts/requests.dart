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
  return req(() => dio.post(apiUrl("verify"), queryParameters: {"code": code}));
}

ValRespFuture getDecks() {
  return req(() => dio.post(apiUrl("findDeck")));
}

// Future<Val<T, String>> Function(RequestParams) requestBuilder<T>(Future<Response<dynamic>> Function() callback) {
//   return (params) async {
//     final Val(ok:respOk, other:respOther) = await req(callback);
//     final deserialized = Val<T, String>(respOther);
//
//     if(respOk == null) {
//       return deserialized;
//     }
//
//     deserialized.ok = T
//
//   };
// }

ValRespFuture createDeck(RequestParams params) async {
  return req(() => dio.post(apiUrl("createDeck"), data: params));
}

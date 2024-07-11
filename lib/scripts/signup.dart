import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'global.dart';

final paramsSignup = {
  "name_first": "",
  "name_last": "",
  "username": "",
  "email": "",
  "password_hash": "",
};

Future submitSignupForm() async {

  Response<dynamic> res;

  try {

    res = await dio.post(apiUrl("register"), data: paramsSignup);

  } on DioException catch (e) {

    res = e.response!;

    // Alert if non-success status code
    final message = res.data["message"];
    log("failure submitting signup info: $message");
    log(jsonEncode(res.data["details"]));
    return;

  }

  // Get authentication cookie
  var sk = getSerializableCookie("auth");
  if(sk == null) {
    return;
  }

  // Print it
  log("${sk.cookie.name}: ${sk.cookie.value}");

  // QuickAlert.show(context: ctx, type: QuickAlertType.success, text: "Registered Account");
  log("successfully submitted signup info");

}
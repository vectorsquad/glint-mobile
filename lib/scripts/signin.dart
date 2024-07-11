import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'global.dart';

final params = {
  "username": "",
  "password_hash": "",
};

Future<Response<dynamic>?> submit() async {

  Response<dynamic> res;

  try {

    res = await dio.post(apiUrl("login"), data: params);

  } on DioException catch (e) {

    res = e.response!;

    // Alert if non-success status code
    final message = res.data["message"];
    log("failure submitting login info: $message");
    log(jsonEncode(res.data["details"]));
    return res;

  }

  return null;

}
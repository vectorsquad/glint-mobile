import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/scripts/requests.dart';
import 'package:quickalert/quickalert.dart';

import 'global.dart';

String Function() str(String s) => () => s;

/// Generic wrapper for optional values with an alternative.
class Val<Ok, Other> {
  Ok? ok;
  Other other;
  Val(this.other);

  Other some(Function(Ok) callback) {
    final okCopy = ok;
    if (okCopy != null) {
      callback(okCopy);
    }
    return other;
  }

  none(Function(Other) callback) {
    final otherCopy = other;
    if (otherCopy != null) {
      callback(otherCopy);
    }
  }
}

/// True if form is valid, false otherwise.
bool validForm(GlobalKey<FormState> form) {
  final currentState = form.currentState;
  if (currentState != null && currentState.validate()) {
    return true;
  }

  return false;
}

typedef ValResponse = Val<Response<dynamic>, String>;

/// Send an HTTP request, return possible success and error response.
Future<ValResponse> req(Future<Response<dynamic>> Function() callback) async {
  final val = Val<Response<dynamic>, String>("");

  try {
    // Successful response
    val.ok = await callback();
    return val;
  } on DioException catch (e) {
    final resp = e.response;

    // No response means server error.
    if (resp == null) {
      val.other = "Could not reach server.";
      return val;
    }

    final data = resp.data;

    // Payload having a message means custom error happened.
    if (data is Map<String, dynamic> && data.containsKey("message")) {
      val.other = data["message"];

      if (data.containsKey("details")) {
        val.other += jsonEncode(data["details"]);
      }

      return val;
    }

    val.other = "Server error, no reason provided";
    return val;
  } catch (e) {
    val.other = e.toString();
    return val;
  }
}

// Navigate to next route
Future<void> replaceRoute(BuildContext context, Widget widget) async {
  await Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (ctx) => widget),
  );
}

Future<void> pushRoute(BuildContext context, Widget widget) async {
  await Navigator.push(context, MaterialPageRoute(builder: (ctx) => widget));
}

Future<void> replaceRouteAll(BuildContext context, Widget widget) async {
  await Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (ctx) => widget), (route) => false);
}

// Construct new list based off of existing list with item inserted in-between.
between<T>(T spacer, List<T> existing) {
  final newList = <T>[];

  for (var i = 0; i < existing.length; i++) {
    newList.add(existing[i]);
    if (i + 1 < existing.length) {
      newList.add(spacer);
    }
  }

  return newList;
}

typedef HttpProps = Map<String, dynamic>;

Future<JWT?> getUserId() async {
  final ck = getSerializableCookie("auth");
  if (ck == null) {
    return null;
  }

  return JWT.decode(ck.cookie.value);
}

Function(String) newParamSetter(Map<String, dynamic> params, String key) {
  return (s) => params[key] = s;
}

Future<void> deleteAuthCache() => cj.delete(apiUri("login"));

Future<Val<List<T>, String>> getList<T>(ValRespFuture Function() fetcher,
    T Function(Map<String, dynamic>) fromJson) async {
  final listVal = Val<List<T>, String>("");

  final Val(:ok, :other) = await fetcher();
  if (ok == null) {
    listVal.other = other;
    return listVal;
  }

  Iterable data = ok.data;
  log(jsonEncode(data));
  List<T> concreteList = [];

  for (final deckObj in data) {
    concreteList.add(fromJson(deckObj));
  }

  listVal.ok = concreteList;

  return listVal;
}

Future<void> alertVal(Val<dynamic, String> data, BuildContext context) async {
  await QuickAlert.show(
      context: context, type: QuickAlertType.error, text: data.other);
}

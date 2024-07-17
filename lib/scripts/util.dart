import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';

import 'global.dart';

String Function() str(String s) => () => s;

class Val<Ok, Other> {
  Ok? ok;
  Other other;
  Val(this.other);

  Other some(Function(Ok) callback) {
    final okCopy = ok;
    if(okCopy != null) {
      callback(okCopy);
    }
    return other;
  }

  none(Function(Other) callback) {
    final otherCopy = other;
    if(otherCopy != null) {
      callback(otherCopy);
    }
  }
}

assignableParam(Map<String, String> m, String k) {
  return (String? v) => {
    if(v != null) {
      m[k] = v
    }
  };
}

// New text editing controllers
Map<String, TextEditingController> newFieldControllers(Map<String, String> params) {
  final controllers = HashMap<String, TextEditingController>();
  for (final k in params.keys) {
    controllers[k] = TextEditingController();
  }
  return controllers;
}

// Return true if a form is valid, false otherwise.
bool validForm(GlobalKey<FormState> form) {

  final currentState = form.currentState;
  if(currentState != null && currentState.validate()) {
    return true;
  }

  return false;
}

typedef ValResponse = Val<Response<dynamic>, String>;

// Send an HTTP request, return possible success and error response.
Future<ValResponse> req(Future<Response<dynamic>> Function() callback) async {

  final val = Val<Response<dynamic>, String>("");

  try {
    // Successful response
    val.ok = await callback();
    return val;

  } on DioException catch (e) {

    final resp = e.response;

    // No response means server error.
    if(resp == null) {
      val.other = "Could not reach server.";
      return val;
    }

    final data = resp.data;

    // Payload having a message means custom error happened.
    if(data is Map<String, dynamic> && data.containsKey("message")) {
      val.other = data["message"];

      if(data.containsKey("details") ) {
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
Future<dynamic> nextRoute(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (ctx) => widget),
  );
}

// Construct new list based off of existing list with item inserted in-between.
between<T>(T spacer, List<T> existing) {
  final newList = <T>[];

  for(var i = 0; i < existing.length; i++) {
    newList.add(existing[i]);
    if(i + 1 < existing.length) {
      newList.add(spacer);
    }
  }

  return newList;

}

typedef RequestParams = Map<String, String>;
typedef RequestParamsControllers = Map<String, TextEditingController>;

typedef HttpProps = Map<String, dynamic>;

Future<JWT?> getUserId() async {

  final ck = getSerializableCookie("auth");
  if(ck == null) {
    return null;
  }

  return JWT.decode(ck.cookie.value);
}
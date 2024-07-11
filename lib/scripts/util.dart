// Create function that, when called, returns the given string.
import 'dart:collection';

import 'package:flutter/material.dart';

String Function() str(String s) => () => s;

assignableParam(Map<String, String> m, String k) {
  return (String? v) => {
    if(v != null) {
      m[k] = v
    }
  };
}

// New field controllers for UI purposes
Map<String, TextEditingController> newFieldControllers(Map<String, String> params) {
  final controllers = HashMap<String, TextEditingController>();
  for (final k in params.keys) {
    controllers[k] = TextEditingController();
  }
  return controllers;
}
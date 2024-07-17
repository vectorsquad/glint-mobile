import 'package:login_signup/scripts/util.dart';

import 'global.dart';

final paramsSignup = {
  "name_first": "",
  "name_last": "",
  "username": "",
  "email": "",
  "password_hash": "",
};

final submitSignup = () => req(
        () => dio.post(apiUrl("register"), data: paramsSignup)
);

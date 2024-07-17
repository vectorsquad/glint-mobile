import 'package:login_signup/scripts/util.dart';

import 'global.dart';

final paramsSignin = {
  "username": "",
  "password_hash": "",
};

final submitSignin = () => req(
        () => dio.post(apiUrl("login"), data: paramsSignin)
);
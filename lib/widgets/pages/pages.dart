import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login_signup/models/models.dart';
import 'package:login_signup/notifiers/notifiers.dart';
import 'package:login_signup/widgets/primitives/primitives.dart';
import 'package:login_signup/widgets/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../scripts/util.dart';
import '../../../theme/theme.dart';
import '../../scripts/inputValidation.dart';
import '../../scripts/requests.dart';

part 'deckListPage.dart';
part 'signInPage.dart';
part 'welcomePage.dart';
part 'loadingPage.dart';
part 'selectedSetPage.dart';
part 'editDeckPage.dart';

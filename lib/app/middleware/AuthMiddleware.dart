import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iq/app/routes/app_routes.dart';
import 'package:iq/main.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    var userToken = sharedPrefs?.getString('login_token');
    // print('userToken: $userToken');
    return userToken != null
        ? null
        : const RouteSettings(name: AppRoutes.INITIAL);
  }
}

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iq/app/routes/app_routes.dart';
import 'package:iq/app/services/api.dart';
import 'package:iq/main.dart';

class LoginController extends GetxController {
  final Dio _dio = Api.dio;
  bool isloading = false;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getInfo() async {
    isloading = true;
    update();
    try {
      var response = await Api.login();

      // print(response.data['data']['token']);
      await sharedPrefs?.setString(
          'login_token', response.data['data']['token']);

      Get.toNamed(AppRoutes.HOME);
      isloading = false;

      update();
    } on DioError catch (e) {
      isloading = false;

      Get.snackbar(
        'Alert',
        'Please make sure you have an internet connection or are connected to IQ!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        borderRadius: 10,
        colorText: Colors.white,
      );
      update();
    }
  }
}

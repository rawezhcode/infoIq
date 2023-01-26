import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iq/app/models/info.dart';
import 'package:iq/app/routes/app_routes.dart';
import 'package:iq/app/services/api.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final Dio _dio = Api.dio;
  bool isloading = false;

  double max = 0;
  double initValue = 0;

  late Info info;

  @override
  void onInit() {
    super.onInit();
    getInfo();
  }

  Future<void> getInfo() async {
    isloading = true;
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    update();
    try {
      var response = await Api.getInfo();

      info = Info.fromJson(response.data['data']);

      var lastRecharge =
          DateFormat('DD/MM/yyyy HH:mm:ss').parse(info.lastRecharge!);
      var cpeExpiry = DateFormat('DD/MM/yyyy HH:mm:ss').parse(info.cpeExpiry!);

      DateTime dt1 = DateTime.parse(lastRecharge.toString());
      DateTime dt2 = DateTime.parse(cpeExpiry.toString());

      Duration diff = dt2.difference(dt1);

      max = diff.inDays.toDouble();

      print(initValue);

      // var dt1 = HttpDate.parse("27/10/2022 14:39:45");

      isloading = false;
      update();
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.data['error']['message'].contains('token is expired')) {
          Get.toNamed(AppRoutes.INITIAL);
          return;
        }
      }

      Get.dialog(
        Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 30),
          backgroundColor: Colors.white.withOpacity(.9),
          child: SizedBox(
            height: 150,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const CircularProgressIndicator(),
                    const Text(
                      'Please make sure you have an internet connection or are connected to IQ!',
                    ),
                    ElevatedButton(
                      onPressed: () => getInfo(),
                      child: const Text('نوێکردنەوە'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }
  }
}

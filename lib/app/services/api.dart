import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as GET;
import 'package:iq/app/config/app_config.dart';
import 'package:iq/main.dart';

class Api {
  static const apiUrl = AppConfig.apiUrl;
  static final dio = Dio(
    BaseOptions(
      baseUrl: apiUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  static void initializeInterceptors() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        var headers = {
          'Accept-Language': 'ku',
          'X-Channel': 'web',
        };
        request.headers.addAll(headers);
        return handler.next(request); //continue
      },
      onResponse: (response, handler) {
        // print('${response.data}');
        if (response.data['error'] == 1) throw response.data['message'];

        return handler.next(response); // continue
      },
      onError: (error, handler) {
        print('${error.response!.data}');

        return handler.next(error); //continue
      },
    ));
  } // end of initializeInterceptor

  static Future<Response> login() async {
    return dio.get('/autologin');
  } //end of login

  static Future<Response> getInfo() async {
    return dio.get(
      '/cpe',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${sharedPrefs?.getString('login_token')}',
        },
      ),
    );
  } //end of login
}

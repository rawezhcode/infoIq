import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iq/app/bindings/app_binding.dart';
import 'package:iq/app/config/app_config.dart';
import 'package:iq/app/routes/app_routes.dart';
import 'package:iq/app/routes/app_pages.dart';
import 'package:iq/app/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPrefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();
  Api.initializeInterceptors();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.title,
      defaultTransition: defaultTransition,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.pages,
    );
  }
}

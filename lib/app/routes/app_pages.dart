import 'package:get/get.dart';
import 'package:iq/app/bindings/home_binding.dart';
import 'package:iq/app/middleware/AuthMiddleware.dart';
import 'package:iq/app/routes/app_routes.dart';
import 'package:iq/resources/views/login.dart';

import '../../resources/views/home.dart';

const defaultTransition = Transition.fadeIn;

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}

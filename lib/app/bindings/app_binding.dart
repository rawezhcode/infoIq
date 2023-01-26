import 'package:get/get.dart';
import 'package:iq/app/controllers/login_controller.dart';

import '../controllers/home_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

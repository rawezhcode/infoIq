import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iq/app/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(125),
                  ),
                ),
                onPressed: () {
                  controller.getInfo();
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF02F6E7),
                        Color(0xFF8F02F8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(125),
                  ),
                  child: Container(
                    width: 250,
                    height: 250,
                    alignment: Alignment.center,
                    child: GetBuilder<LoginController>(
                      builder: (_) {
                        return controller.isloading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'Start',
                                style: TextStyle(
                                  fontSize: 55,
                                  fontStyle: FontStyle.italic,
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => Get.offAllNamed('/login'));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Center(
            //     child: Text(
            //       'PT MULTI KARYA SETANGKAI',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 40,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

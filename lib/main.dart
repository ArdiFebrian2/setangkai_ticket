import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:setangkai_ticket/app/modules/form_kirimpaket/views/form_kirimpaket_view.dart';
import 'package:setangkai_ticket/app/modules/home/controllers/home_controller.dart';
import 'package:setangkai_ticket/app/modules/login/controllers/login_controller.dart';
import 'package:setangkai_ticket/app/modules/login/views/login_view.dart';
import 'package:setangkai_ticket/app/modules/profile/views/profile_view.dart';
import 'package:setangkai_ticket/app/modules/register/views/register_view.dart';
import 'app/modules/form_bus/controllers/form_bus_controller.dart';
import 'app/modules/form_bus/views/form_bus_view.dart';
import 'app/modules/info/controllers/info_controller.dart';
import 'app/modules/main_navigation/views/main_navigation_view.dart';
import 'app/modules/order/controllers/order_controller.dart';
import 'app/modules/order/views/order_view.dart';
import 'app/modules/profile/controllers/profile_controller.dart';
import 'app/modules/splashscreen/views/splashscreen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => InfoController());
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => FormBusController());
    Get.lazyPut(() => LoginController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Setangkai Ticket',
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: '/splashscreen',
      getPages: [
        GetPage(name: '/splashscreen', page: () => SplashscreenView()),
        GetPage(
          name: '/login',
          page: () => LoginView(),
        ),
        GetPage(
          name: '/main_navigation',
          page: () => MainNavigationView(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterView(),
        ),
        GetPage(
          name: '/form-kirimpaket',
          page: () => FormKirimpaketView(),
        ),
        GetPage(
          name: '/profile',
          page: () => ProfileView(),
        ),
        GetPage(
          name: '/form-bus',
          page: () => FormBusView(),
        ),
        GetPage(name: '/order', page: () => OrderView()),
      ],
    );
  }
}

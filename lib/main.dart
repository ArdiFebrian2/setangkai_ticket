import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:setangkai_ticket/app/modules/login/views/login_view.dart';
import 'package:setangkai_ticket/app/modules/register/views/register_view.dart';
import 'app/modules/main_navigation/views/main_navigation_view.dart';
import 'app/modules/splashscreen/views/splashscreen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        )
      ],
    );
  }
}

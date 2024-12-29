import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setangkai_ticket/app/modules/home/views/home_view.dart';
import 'package:setangkai_ticket/app/modules/info/views/info_view.dart';
import 'package:setangkai_ticket/app/modules/order/views/order_view.dart';
import 'package:setangkai_ticket/app/modules/profile/views/profile_view.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';
import '../controllers/main_navigation_controller.dart';

class MainNavigationView extends GetView<MainNavigationController> {
  MainNavigationView({super.key}) {
    Get.put(MainNavigationController());
  }

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(MainNavigationController());

    return Scaffold(
      body: Obx(() {
        switch (navigationController.selectedIndex.value) {
          case 0:
            return const HomeView();
          case 1:
            return const InfoView();
          case 2:
            return OrderView();
          default:
            return const ProfileView();
        }
      }),
      bottomNavigationBar: Obx(
        () => Container(
          height: 72,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            color: secondary,
          ),
          child: BottomNavigationBar(
            currentIndex: navigationController.selectedIndex.value,
            onTap: navigationController.changeTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                label: 'FAQ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_num),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileCard(),
              const SizedBox(height: 20),
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 20),
              _buildUserInfo(),
              const SizedBox(height: 230),
              _buildLogoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: const Text(
        'Profile',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  Widget _buildProfileCard() {
    return Column(
      children: [
        _buildProfilePicture(),
        const SizedBox(height: 16),
        Obx(
          () => Text(
            controller.name.value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Obx(
          () => Text(
            controller.email.value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfilePicture() {
    return GestureDetector(
      onTap: () {
        controller.pickImage();
      },
      child: Obx(
        () => Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: controller.photoPath.value.contains('assets')
                  ? AssetImage(controller.photoPath.value) as ImageProvider
                  : FileImage(File(controller.photoPath.value)),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: secondary,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.phone, color: Colors.blue),
          title: Obx(
            () => Text(
              controller.phone.value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.location_on, color: Colors.red),
          title: Obx(
            () => Text(
              controller.address.value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton() {
    return ElevatedButton(
      onPressed: () {
        Get.offAllNamed('/login');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: secondary,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Colors.grey,
        elevation: 5,
      ),
      child: const Text(
        'Logout',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

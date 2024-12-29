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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileCard(),
              const SizedBox(height: 24),
              _buildProfileOptions(),
              const SizedBox(height: 16),
              _buildLogoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  // ==============================
  // AppBar
  // ==============================
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

  // ==============================
  // Profile Card
  // ==============================
  Widget _buildProfileCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfilePicture(),
            const SizedBox(height: 16),
            _buildProfileName(),
            _buildProfileEmail(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return GestureDetector(
      onTap: () {
        controller.pickImage();
      },
      child: Obx(
        () => CircleAvatar(
          radius: 60,
          backgroundImage: controller.photoPath.value.contains('assets')
              ? AssetImage(controller.photoPath.value) as ImageProvider
              : FileImage(File(controller.photoPath.value)),
        ),
      ),
    );
  }

  Widget _buildProfileName() {
    return Obx(
      () => Text(
        controller.name.value,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProfileEmail() {
    return Text(
      'ardifebrian@gmail.com',
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[600],
      ),
    );
  }

  // ==============================
  // Profile Options List
  // ==============================
  Widget _buildProfileOptions() {
    return Column(
      children: [
        _buildOptionCard(
          icon: Icons.account_circle,
          label: 'Account Settings',
          onTap: () {},
        ),
        _buildOptionCard(
          icon: Icons.history,
          label: 'Order History',
          onTap: () {
            Get.toNamed('/order');
          },
        ),
        _buildOptionCard(
          icon: Icons.lock_outline,
          label: 'Change Password',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildOptionCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: secondary, size: 28),
        title: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // ==============================
  // Logout Button
  // ==============================
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

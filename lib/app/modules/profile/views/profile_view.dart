import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ardi Febrian',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ardifebrian@gmail.com', // Replace with dynamic data
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Profile Options List
            _ProfileOption(
              icon: Icons.account_circle,
              label: 'Account Settings',
              onTap: () {
                // Navigate to account settings
              },
            ),
            _ProfileOption(
              icon: Icons.history,
              label: 'Order History',
              onTap: () {
                // Navigate to order history
              },
            ),
            _ProfileOption(
              icon: Icons.favorite_border,
              label: 'Wishlist',
              onTap: () {
                // Navigate to wishlist
              },
            ),
            _ProfileOption(
              icon: Icons.notifications,
              label: 'Notifications',
              onTap: () {
                // Navigate to notifications
              },
            ),
            _ProfileOption(
              icon: Icons.help_outline,
              label: 'Help & Support',
              onTap: () {
                // Navigate to help and support
              },
            ),
            const Spacer(),
            // Logout Button
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/login');
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: secondary,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: secondary),
      title: Text(label),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}

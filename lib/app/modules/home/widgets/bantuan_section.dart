import 'package:flutter/material.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';

class BantuanSection extends StatelessWidget {
  const BantuanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Perlu Bantuan?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Tambahkan logika untuk membuka WhatsApp
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Hubungi kami melalui WhatsApp")),
                );
              },
              icon: const Icon(Icons.phone, color: Colors.white),
              label: const Text(
                "Hubungi Kami",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

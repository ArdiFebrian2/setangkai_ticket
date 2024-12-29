import 'package:flutter/material.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class BantuanSection extends StatelessWidget {
  const BantuanSection({super.key});

  void _launchWhatsApp(String phoneNumber) async {
    final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");
    if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch WhatsApp');
    }
  }

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
                _launchWhatsApp("+6282288648551"); // Ganti dengan nomor tujuan
              },
              icon: Image.asset(
                'assets/images/wa.png',
                width: 24,
                height: 24,
              ),
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

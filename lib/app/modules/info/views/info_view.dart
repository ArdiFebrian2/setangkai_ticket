import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => InfoController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'FAQ',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle for Peraturan Calon Penumpang
            _buildSectionToggle(
              title: 'Peraturan Calon Penumpang',
              isVisible: controller.showPassengerRules,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: _buildBoldedText(
                  '''
1. Calon penumpang PT. Multi Karya Setangkai melakukan pemesanan tiket atau reservasi jauh hari dari hari keberangkatan.
2. Calon penumpang PT. Multi Karya Setangkai harus hadir pada keberangkatan yang sudah di tetapkan 30 menit sebelum jam keberangkatan.
''',
                ),
              ),
            ),

            // Toggle for Peraturan Pengiriman Paket
            _buildSectionToggle(
              title: 'Peraturan Pengiriman Paket',
              isVisible: controller.showPackageRules,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: _buildBoldedText(
                  '''
1. Setiap pengiriman paket harus dijelaskan isinya dan dikemas dengan BAIK dan RAPI. Kehilangan bukan menjadi tanggung jawab PT. Multi Karya Setangkai.
''',
                ),
              ),
            ),

            // Toggle for Jadwal Keberangkatan
            _buildSectionToggle(
              title: 'Jadwal Keberangkatan',
              isVisible: controller.showSchedule,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Dari Padang')),
                    DataColumn(label: Text('Dari Lintau')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('08.00')),
                      DataCell(Text('07.00')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12.00')),
                      DataCell(Text('11.00')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('17.00')),
                      DataCell(Text('16.00')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('21.00')),
                      DataCell(Text('20.00')),
                    ]),
                  ],
                ),
              ),
            ),

            // Toggle for Alamat
            _buildSectionToggle(
              title: 'Alamat',
              isVisible: controller.showAddress,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: _buildBoldedText(
                  '''
Kantor Pusat PT. Multi Karya Setangkai:
Jl. Merdeka No. 123, Padang, Sumatera Barat.
Telp: 0751-123456
Email: info@multikarya.com
                  ''',
                ),
              ),
            ),

            // Toggle for Lain-lain
            _buildSectionToggle(
              title: 'Lain-lain',
              isVisible: controller.showOthers,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: _buildBoldedText(
                  '''
Informasi Tambahan:
1. Semua informasi ini dapat berubah sewaktu-waktu tanpa pemberitahuan.
2. Untuk pertanyaan lebih lanjut, hubungi layanan pelanggan.
                  ''',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Fungsi untuk membuat kata kunci menjadi bold
  Widget _buildBoldedText(String text) {
    const keyword = "PT. Multi Karya Setangkai";
    final spans = <TextSpan>[];

    text.split('\n').forEach((line) {
      final parts = line.split(keyword);
      for (int i = 0; i < parts.length; i++) {
        spans.add(TextSpan(text: parts[i]));
        if (i != parts.length - 1) {
          spans.add(const TextSpan(
            text: keyword,
            style: TextStyle(fontWeight: FontWeight.bold),
          ));
        }
      }
      spans.add(const TextSpan(text: '\n'));
    });

    return RichText(
      text: TextSpan(
        children: spans,
        style: const TextStyle(color: Colors.black),
      ),
      textAlign: TextAlign.justify,
    );
  }

  /// Fungsi untuk membuat toggle pada setiap section
  Widget _buildSectionToggle({
    required String title,
    required RxBool isVisible,
    required Widget child,
  }) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            trailing: IconButton(
              icon:
                  Icon(isVisible.value ? Icons.expand_less : Icons.expand_more),
              onPressed: () => isVisible.toggle(),
            ),
          ),
          if (isVisible.value) child,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: const Text(
                  'Peraturan Calon Penumpang\n"PT. Multi Karya Setangkai"',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: _buildBoldedText(
                '''
1. Calon penumpang PT. Multi Karya Setangkai melakukan pemesanan tiket atau reservasi jauh hari dari hari keberangkatan.
2. Calon penumpang PT. Multi Karya Setangkai harus hadir pada keberangkatan yang sudah di tetapkan 30 menit sebelum jam keberangkatan.
3. Konsultasikan jenis barang yang akan di bawa kepada pihak PT. Multi Karya Setangkai untuk menyelesaikan semua administrasi dan memastikan semua barang ada dalam bagasi bus.
4. Apabila 10 menit sebelum keberangkatan, calon penumpang tidak hadir maka penumpang dianggap GAGAL dan uang tiket yang sudah di bayar dianggap hangus serta harus membeli tiket baru di kantor PT. Multi Karya Setangkai.
5. Apabila calon penumpang tidak jadi berangkat di harapkan konfirmasi ke pihak kantor PT. Multi Karya Setangkai.
6. Tiket dianggap hilang dengan segala kerugian calon penumpang.
7. Pembatalan tiket dipotong 50%.
8. Barang-barang kecil maupun besar yang dibongkar/disusun sendiri dan jika hilang menjadi tanggung jawab penumpang sendiri.
9. Pada suatu kecelakaan diluar kekuasaan kami, ganti rugi terhadap barang yang rusak tidak menjadi tanggung jawab PT. Multi Karya Setangkai.
10. Jika bagasi penumpang tidak cocok keadaan bus kami, uang dikembalikan penuh oleh PT. Multi Karya Setangkai tetapi bus TIDAK AKAN BERANGKAT.
11. Biaya tambahan jika barang melebihi ketentuan yang ada akan menjadi tanggung jawab penumpang.
12. Tiket yang sudah di bayar tidak bisa dikembalikan kecuali untuk kondisi darurat.''',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: const Text(
                  'Peraturan Pengiriman Paket\n"PT. Multi Karya Setangkai"',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: _buildBoldedText(
                '''
1. Setiap pengiriman paket harus dijelaskan isinya dan dikemas dengan BAIK dan RAPI. Kehilangan bukan menjadi tanggung jawab PT. Multi Karya Setangkai.
2. Pengiriman barang khusus makanan tidak ada pengembalian dana jika barang rusak atau basi.
3. Setiap pengirim paket harus memberikan kontak penerima dengan jelas.
4. Paket yang tidak diambil selama 3 hari akan menjadi risiko penerima.''',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: const Text(
                  'Jadwal Keberangkatan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Padding(
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: const Text(
                  'Alamat Kantor',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                '''
            Kantor Pusat: Jl. Pasar Minggu No. 55 Bus Kec. Lintau Buo - Tanah Datar
            Padang: Jl. S. Parman No. 233A (Bundaran DPR Prov) Ulak Karang - Padang
            ''',
                textAlign: TextAlign.justify,
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
}

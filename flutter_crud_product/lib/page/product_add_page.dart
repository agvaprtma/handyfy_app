import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/globals.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final namaCtrl = TextEditingController();
  final merkCtrl = TextEditingController();
  final hargaCtrl = TextEditingController();
  final deskCtrl = TextEditingController();
  final fotoCtrl = TextEditingController();

  Future<void> simpanProduct() async {
    final response = await http.post(
      Uri.parse("${Globals.baseUrl}/tambah.php"),
      body: {
        "nama": namaCtrl.text,
        "merk": merkCtrl.text,
        "harga": hargaCtrl.text,
        "deskripsi": deskCtrl.text,
        "foto": fotoCtrl.text,
      },
    );

    print("RESPONSE TAMBAH => ${response.body}");

    if (!mounted) return;

    if (response.body.contains("success")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product berhasil ditambahkan")),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Gagal: ${response.body}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Product")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: namaCtrl,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: merkCtrl,
              decoration: const InputDecoration(labelText: "Merk"),
            ),
            TextField(
              controller: hargaCtrl,
              decoration: const InputDecoration(labelText: "Harga"),
            ),
            TextField(
              controller: deskCtrl,
              decoration: const InputDecoration(labelText: "Deskripsi"),
            ),
            TextField(
              controller: fotoCtrl,
              decoration: const InputDecoration(labelText: "Nama Foto"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: simpanProduct,
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_crud_product/model/product.dart';
import 'package:http/http.dart' as http;
import '../config/globals.dart';

class ProductEditPage extends StatefulWidget {
  final Product product;

  const ProductEditPage({super.key, required this.product});

  @override
  State<ProductEditPage> createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  late TextEditingController namaCtrl;
  late TextEditingController merkCtrl;
  late TextEditingController hargaCtrl;
  late TextEditingController deskCtrl;
  late TextEditingController fotoCtrl;

  @override
  void initState() {
    super.initState();

    namaCtrl = TextEditingController(text: widget.product.nama);
    merkCtrl = TextEditingController(text: widget.product.merk);
    hargaCtrl = TextEditingController(text: widget.product.harga);
    deskCtrl = TextEditingController(text: widget.product.deskripsi);
    fotoCtrl = TextEditingController(text: widget.product.foto);
  }

  @override
  void dispose() {
    namaCtrl.dispose();
    merkCtrl.dispose();
    hargaCtrl.dispose();
    deskCtrl.dispose();
    fotoCtrl.dispose();
    super.dispose();
  }

  Future<void> updateProduct(int id) async {
    final response = await http.post(
      Uri.parse("${Globals.baseUrl}/update.php"),
      body: {
        "id": id.toString(),
        "nama": namaCtrl.text,
        "merk": merkCtrl.text,
        "harga": hargaCtrl.text,
        "deskripsi": deskCtrl.text,
        "foto": fotoCtrl.text,
      },
    );

    print("RESPONSE UPDATE => ${response.body}");

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Product")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
              decoration: const InputDecoration(
                labelText: "Nama File Foto (contoh: samsung.jpg)",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateProduct(widget.product.id);
              },
              child: const Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}

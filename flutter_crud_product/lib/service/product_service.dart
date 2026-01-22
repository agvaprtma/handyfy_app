import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/globals.dart';
import '../model/product.dart';

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse("${Globals.baseUrl}/tampil.php"));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Gagal mengambil data product");
    }
  }

  static Future<void> hapusProduct(int id) async {
    final response = await http.post(
      Uri.parse("${Globals.baseUrl}/hapus.php"),
      body: {"id": id.toString()},
    );

    if (response.statusCode != 200) {
      throw Exception("Gagal menghapus product");
    }
  }
}

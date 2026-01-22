class Product {
  final int id;
  final String nama;
  final String merk;
  final String harga;
  final String deskripsi;
  final String foto;

  Product({
    required this.id,
    required this.nama,
    required this.merk,
    required this.harga,
    required this.deskripsi,
    required this.foto,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json['id'].toString()),
      nama: json['nama'],
      merk: json['merk'],
      harga: json['harga'],
      deskripsi: json['deskripsi'],
      foto: json['foto'],
    );
  }
}

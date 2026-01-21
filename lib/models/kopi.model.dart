class Kopi {
  String id;
  String nama;
  int harga;

  Kopi({required this.id, required this.nama, required this.harga});

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'harga': harga,
  };

  factory Kopi.fromJson(Map<String, dynamic> json, String id) =>
      Kopi(id: id, nama: json['nama'], harga: json['harga'] ?? 0);
}

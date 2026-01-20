class Kopi {
  String id;
  String nama;
  String deskripsi;

  Kopi({required this.id, required this.nama, required this.deskripsi});

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'deskripsi': deskripsi,
  };

  factory Kopi.fromJson(Map<String, dynamic> json, String id) =>
      Kopi(id: id, nama: json['nama'], deskripsi: json['deskripsi']);
}

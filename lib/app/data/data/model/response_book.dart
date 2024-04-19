
import 'dart:convert';

// Fungsi untuk mengonversi JSON menjadi ResponseBook
ResponseBook responseBookFromJson(String str) =>
    ResponseBook.fromJson(json.decode(str));

// Fungsi untuk mengonversi ResponseBook menjadi JSON
// String responseBookToJson(ResponseBook data) => json.encode(data.toJson());

// Menggunakan ResponseBook untuk mengelola data JSON
class ResponseBook {
  ResponseBook({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  List<DataBook>? data;

  factory ResponseBook.fromJson(List<dynamic> json) {
    return ResponseBook(
      statusCode: json[0]["Statuscode"],
      message: json[0]["message"],
      data: List<DataBook>.from(json[0]["data"].map((json) => DataBook.fromJson(json))),
    );
  }
}


class DataBook {
  DataBook({
    this.bukuId,
    this.judul,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.image,
    this.deskripsi_buku,
    this.rating,
    this.genre,


  });

  int? bukuId;
  String? judul;
  String? penulis;
  String? penerbit;
  String? tahunTerbit;
  String? image;
  String? deskripsi_buku;
  String? namaKategory;
  String? rating;
  String? genre;

  factory DataBook.fromJson(Map<String, dynamic> json) => DataBook(
    bukuId: json["buku_id"],
    judul: json["judul"],
    penulis: json["penulis"],
    penerbit: json["penerbit"],
    tahunTerbit: json["tahun_terbit"],
    image: json["image"],
    deskripsi_buku: json["deskripsi_buku"],
    rating: json["rating"],
    genre: json["genre"],
  );

  Map<String, dynamic> toJson() => {
    "buku_id": bukuId,
    "judul": judul,
    "penulis": penulis,
    "penerbit": penerbit,
    "tahun_terbit": tahunTerbit,
    "image": image,
    "deskripsi_buku": deskripsi_buku,
    "rating": rating,
    "genre": genre,
  };
}

void main() {
  // Contoh penggunaan
  String jsonString = '''
    {
        "Statuscode": 200,
        "message": "SUCCESS",
        "data": [
            {
                "id": 1,
                "judul": "solo leveling",
                "penulis": "aku",
                "penerbit": "aku",
                "tahun_terbit": 2021,
                "image": "http://192.168.6.16:3000/image/image_1708315289688.jpg"
                "deskripsi_buku": "Dongeng, cerita, dan semacamnya merupakan sarana yang cukup efektif untuk membentuk karakter anak yang berbudi pekerti mulia. Lebih dari itu, dongeng juga bisa meningkatkan keterampilan berbahasa anak, meningkatkan minat baca, memupuk daya imajinasi, dan juga memperat ikatan emosional anak dengan orang tuanya. Oleh karena itu, jangan bosan-bosan untuk membacakan dongeng kepada buah hati Anda tercinta.\n\nLewat buku “Kumpulan Dongeng Petualangan Si Kancil” ini, buah hati Anda akan diajak untuk menyelami kisah-kisah kancil yang seru, menegangkan, sampai mengharu biru untuk diikuti. Tidak hanya itu saja, si kecil juga akan diajak untuk menghayati pesan moral yang terkandung di dalam setiap cerita. Adanya buku ini, diharapkan bisa membuat anak tumbuh menjadi pribadi yang hangat, bersahabat, dan juga memiliki budi pekerti yang mulia.\n\nBuku ini sendiri berisi kumpulan dongeng kancil pilihan yang sarat akan teladan. Disusun dengan gaya bahasa yang ringan dan sederhana, yang sesuai dengan tingkat pemahaman anak, sehingga anak jadi bisa lebih memahami cerita. Kemudian, buku ini juga dilengkapi dengan ilustrasi yang jenaka dan penuh dengan warna, sehingga si kecil akan merasa senang dengan membaca buku ini."
            }
        ]
    }
  ''';

  // Mengonversi JSON menjadi objek Dart
  ResponseBook responseBook = responseBookFromJson(jsonString);

  // Mencetak data buku dari objek Dart
  print('Status Code: ${responseBook.statusCode}');
  print('Message: ${responseBook.message}');
  print('Data Buku:');
  responseBook.data!.forEach((dataBook) {
    print('  - ID: ${dataBook.bukuId}');
    print('    Judul: ${dataBook.judul}');
    print('    Penulis: ${dataBook.penulis}');
    print('    Penerbit: ${dataBook.penerbit}');
    print('    Tahun Terbit: ${dataBook.tahunTerbit}');
    print('    Image: ${dataBook.image}');
    print('    deskripsi_buku: ${dataBook.deskripsi_buku}');
    print('    rating: ${dataBook.rating}');
    print('    genre: ${dataBook.genre}');
  });
}

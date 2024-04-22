/// Statuscode : 200
/// message : "SUCCESS"
/// data : [{"peminjaman_id":1,"user_id":1,"buku_id":1,"tanggal_pinjam":"2024-04-20T17:00:00.000Z","tanggal_kembali":"2024-04-21T17:00:00.000Z","status":"DIPINJAM","buku":{"created_at":"2024-03-31T15:37:47.000Z","updated_at":"2024-03-31T15:37:47.000Z","judul":"Lookism","penulis":"Taejoon Park","penerbit":"Webtoon","tahun_terbit":"2020","image":"image/image_1711899467362.jpeg","deskripsi_buku":"Lookism mengisahkan tentang seorang remaja laki-laki bernama Park Hyung Seok yang mengalami bully penampilannya yang dianggap tidak menarik. Bully yang begitu parah membuatnya memutuskan untuk pindah rumah dan sekolah. Tak disangka, keputusan pindah itu ternyata benar-benar mengubah kehidupan Park Hyung Seok.","rating":"9.7","genre":"Aksi"}}]

class ResponsePinjam {
  ResponsePinjam({
    this.statuscode,
    this.message,
    this.data,});

  ResponsePinjam.fromJson(dynamic json) {
    statuscode = json['Statuscode'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPinjam.fromJson(v));
      });
    }
  }
  int? statuscode;
  String? message;
  List<DataPinjam>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Statuscode'] = statuscode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// peminjaman_id : 1
/// user_id : 1
/// buku_id : 1
/// tanggal_pinjam : "2024-04-20T17:00:00.000Z"
/// tanggal_kembali : "2024-04-21T17:00:00.000Z"
/// status : "DIPINJAM"
/// buku : {"created_at":"2024-03-31T15:37:47.000Z","updated_at":"2024-03-31T15:37:47.000Z","judul":"Lookism","penulis":"Taejoon Park","penerbit":"Webtoon","tahun_terbit":"2020","image":"image/image_1711899467362.jpeg","deskripsi_buku":"Lookism mengisahkan tentang seorang remaja laki-laki bernama Park Hyung Seok yang mengalami bully penampilannya yang dianggap tidak menarik. Bully yang begitu parah membuatnya memutuskan untuk pindah rumah dan sekolah. Tak disangka, keputusan pindah itu ternyata benar-benar mengubah kehidupan Park Hyung Seok.","rating":"9.7","genre":"Aksi"}

class DataPinjam {
  DataPinjam({
    this.peminjamanId,
    this.userId,
    this.bukuId,
    this.tanggalPinjam,
    this.tanggalKembali,
    this.status,
    this.buku,});

  DataPinjam.fromJson(dynamic json) {
    peminjamanId = json['peminjaman_id'];
    userId = json['user_id'];
    bukuId = json['buku_id'].toString();
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
    buku = json['buku'] != null ? Buku.fromJson(json['buku']) : null;
  }
  int? peminjamanId;
  String? userId;
  String? bukuId;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? status;
  Buku? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['peminjaman_id'] = peminjamanId;
    map['user_id'] = userId;
    map['buku_id'] = bukuId;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['status'] = status;
    if (buku != null) {
      map['buku'] = buku?.toJson();
    }
    return map;
  }

}

/// created_at : "2024-03-31T15:37:47.000Z"
/// updated_at : "2024-03-31T15:37:47.000Z"
/// judul : "Lookism"
/// penulis : "Taejoon Park"
/// penerbit : "Webtoon"
/// tahun_terbit : "2020"
/// image : "image/image_1711899467362.jpeg"
/// deskripsi_buku : "Lookism mengisahkan tentang seorang remaja laki-laki bernama Park Hyung Seok yang mengalami bully penampilannya yang dianggap tidak menarik. Bully yang begitu parah membuatnya memutuskan untuk pindah rumah dan sekolah. Tak disangka, keputusan pindah itu ternyata benar-benar mengubah kehidupan Park Hyung Seok."
/// rating : "9.7"
/// genre : "Aksi"

class Buku {
  Buku({
    this.createdAt,
    this.updatedAt,
    this.judul,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.image,
    this.deskripsiBuku,
    this.rating,
    this.genre,});

  Buku.fromJson(dynamic json) {
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    image = json['image'];
    deskripsiBuku = json['deskripsi_buku'];
    rating = json['rating'];
    genre = json['genre'];
  }
  String? createdAt;
  String? updatedAt;
  String? judul;
  String? penulis;
  String? penerbit;
  String? tahunTerbit;
  String? image;
  String? deskripsiBuku;
  String? rating;
  String? genre;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['judul'] = judul;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['image'] = image;
    map['deskripsi_buku'] = deskripsiBuku;
    map['rating'] = rating;
    map['genre'] = genre;
    return map;
  }

}

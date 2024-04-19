/// status : 200
/// message : "Login Success"
/// data : {"id":1,"username":"testing","nama":"Romli","telp":"085334","alamat":"Solo","role":"PETUGAS","created_at":"2024-01-09T01:55:16.000000Z","updated_at":"2024-01-09T01:55:16.000000Z"}

class ResponseLogin {
  ResponseLogin({
    this.status,
    this.message,
    this.data,});

  ResponseLogin.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;

  }
  int? status;
  String? message;
  DataLogin? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 1
/// username : "testing"
/// nama : "Romli"
/// telp : "085334"
/// alamat : "Solo"
/// role : "PETUGAS"
/// created_at : "2024-01-09T01:55:16.000000Z"
/// updated_at : "2024-01-09T01:55:16.000000Z"

class DataLogin {
  DataLogin({
    this.id,
    this.username,
    this.password,
    this.email,
    this.namaLengkap,
    this.alamat,
    this.roleId,});

  DataLogin.fromJson(dynamic json) {
    id = json['user_id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    namaLengkap = json['nama_lengkap'];
    alamat = json['alamat'];
    roleId = json['role_id'];
  }
  int? id;
  String? username;
  String? password;
  String? email;
  String? namaLengkap;
  String? alamat;
  int? roleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['password'] = password;
    map['email'] = email;
    map['nama_lengkap'] = namaLengkap;
    map['alamat'] = alamat;
    map['role_id'] = roleId;
    return map;
  }

}
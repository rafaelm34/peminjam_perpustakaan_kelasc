import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  var username = ''.obs;
  final count = 0.obs;

  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    username.value = StorageProvider.read(StorageKey.username);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ProfileController() {
    // Menggunakan async/await untuk melakukan panggilan API dengan await
    Future<String> profile() async {
      // Panggil metode get dari ApiProvider untuk melakukan panggilan API
      final response = await ApiProvider.instance().get(Endpoint.login,
          data: {
            'username': usernameController.text.toString(),
          }
      );
      // Periksa apakah respons memiliki status code 200 (OK)
      if (response.statusCode == 200) {
        // Jika panggilan berhasil, dekode respons JSON
        Map<String, dynamic> profileData = jsonDecode(response.data);
        // Kembalikan nama profil dari data yang diterima
        return profileData['username'];
      } else {
        // Jika panggilan gagal, lempar exception
        throw Exception('Failed to load profile data');
      }
    }
  }

  logout() async {
    loading(true);
    await StorageProvider.delete(StorageKey.status);
    await StorageProvider.delete(StorageKey.userId);
    Get.offAllNamed(Routes.LOGIN);
  }


  void increment() => count.value++;
}
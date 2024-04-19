import 'dart:developer';

import 'package:dio/dio.dart' ;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_login.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;
  final isPasswordVisible = false.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    // log("status: $status");
    log("status : $status");
    if (status == 'logged') {
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: {
              "username": usernameController.text.toString(),
              "password": passwordController.text.toString()});
        print("response.statusCode");
        print(response.data);
        if (response.statusCode == 200) {
          final ResponseLogin responseLogin = ResponseLogin.fromJson(
              response.data);
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.userId, responseLogin.data?.id?.toString() ?? "");
          await StorageProvider.write(StorageKey.username, responseLogin.data!.username.toString());
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
  void togglePasswordVisibility() {
    // Ubah status password (terlihat atau tidak) saat tombol "eye" ditekan
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}

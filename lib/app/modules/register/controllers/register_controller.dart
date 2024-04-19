import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_register.dart';

import '../../../data/data/constant/endpoint.dart';
import '../../../data/data/provider/api_provider.dart';
import 'package:dio/dio.dart' as dio;

import '../../../data/data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;
  final isPasswordVisible = false.obs;

  //TODO: Implement RegisterController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  register() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) ;
      {
        final response = await ApiProvider.instance().post(Endpoint.register,
            data: ({
              "nama": namaController.text.toString(),
              "username": usernameController.text.toString(),
              "telp": telpController.text.toString(),
              "alamat": alamatController.text.toString(),
              "password": passwordController.text.toString()
            }));

        if (response.statusCode == 201) {
          Get.back();
          // Get.offAllNamed(Routes.LOGIN);
        } else {
          Get.snackbar("Sorry", "Register Gagal",
              backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
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

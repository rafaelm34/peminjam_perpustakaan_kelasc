import 'dart:developer';
import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_login.dart';

import '../../../data/data/constant/endpoint.dart';
import '../../../data/data/provider/api_provider.dart';
import '../../../data/data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import 'package:dio/dio.dart' as dio;

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;
  //TODO: Implement LoginController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    if(status == 'logged'){
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
      if (formKey.currentState!.validate());
      {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: dio.FormData.fromMap(
                {"username": usernameController.text.toString(),
                  "password": passwordController.text.toString()}));
        if (response.statusCode == 200) {
          final ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.idUser, responseLogin.data!.id!.toString());
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }loading(false);
    } on dio.DioException catch (e) {loading(false);
    if (e.response != null) {
      if (e.response?.data != null) {
        Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
      }
    } else {
      Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
    }
    } catch (e) {loading(false);
    Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
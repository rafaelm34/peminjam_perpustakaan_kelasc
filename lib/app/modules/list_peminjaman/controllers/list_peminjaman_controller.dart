import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/data/constant/endpoint.dart';
import '../../../data/data/model/response_pinjam.dart';
import '../../../data/data/provider/api_provider.dart';
import '../../../data/data/provider/storage_provider.dart';

class ListPeminjamanController extends GetxController {
  var dataPinjamList = <DataPinjam>[].obs;
  final loading = false.obs;
  var user_id = ''.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    user_id.value = StorageProvider.read(StorageKey.userId).toString();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getData() async {
    loading(true);
    try {
      final responsePinjam = await ApiProvider.instance().get("${Endpoint.pinjam}/${user_id.value}");
      if (responsePinjam.statusCode == 200) {
        final List<DataPinjam> dataPinjam = (responsePinjam.data[0]['data'] as List)
            .map((json) => DataPinjam.fromJson(json))
            .toList();

        dataPinjamList.assignAll(dataPinjam);
      } else {
        Get.snackbar("Sorry", "Gagal Memuat Buku", backgroundColor: Colors.orange);
      }
      loading(false);
    } catch (e) {
      loading(false);
      Get.snackbar("Error", "Terjadi kesalahan saat memuat data: ${e.toString()}", backgroundColor: Colors.red);
    }
  }

  void increment() => count.value++;
}

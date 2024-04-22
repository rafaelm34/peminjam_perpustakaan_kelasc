// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/data/data/constant/endpoint.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_book.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_pinjam.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/api_provider.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/storage_provider.dart';
//
// class ListPeminjamanController extends GetxController with StateMixin<List<DataPinjam>>{
//   var dataPinjamList = <DataPinjam>[].obs;
//   //TODO: Implement ListPeminjamanController
//
//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//     getData();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//     getData();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   getData() async {
//     change(null, status: RxStatus.loading());
//     try {
//       final response = await ApiProvider.instance().get(
//         "${Endpoint.pinjam}/${StorageProvider.read(StorageKey.userId)}");
//       if (response.statusCode == 200) {
//         // final ResponsePinjam responseData = ResponsePinjam.fromJson(response.data);
//         // final List<DataPinjam> responseDataPinjam = responseData.data ?? [];
//         // dataPinjamList.assignAll(responseDataPinjam);
//         // if (responseData.data!.isEmpty) {
//         //   change(null, status: RxStatus.empty());
//         // } else {
//         //   change(responseData.data, status: RxStatus.success());
//         // }
//       } else {
//         change(null, status: RxStatus.error("Gagal mengambil data"));
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         if (e.response?.data != null) {
//           change(null,
//               status: RxStatus.error(" dio ${e.response?.data['message']}"));
//         }
//
//       } else {
//         change(null, status: RxStatus.error("cek" + (e.message ?? "")));
//       }
//     } catch (e) {
//       // log("catch")
//       change(null, status: RxStatus.error("catch " + e.toString()));
//     }
//   }
// }

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


  // getData() async {
  //   change(null, status: RxStatus.loading());
  //   try {
  //     final response = await ApiProvider.instance().get("${Endpoint.pinjam}/${user_id.value}");
  //     if (response.statusCode == 200) {
  //       final ResponsePeminjaman responsePeminjaman = ResponsePeminjaman.fromJson(response.data);
  //       if(responsePeminjaman.data!.isEmpty){
  //         change(null, status: RxStatus.empty());
  //       } else {
  //         change(responsePeminjaman.data, status: RxStatus.success());
  //       }
  //     } else {
  //       change(null, status: RxStatus.error('Gagal mengambil data'));
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         change(null, status: RxStatus.error(" dio ${e.response?.data['message']}"));
  //       }
  //     } else {
  //       change(null, status: RxStatus.error('cek' + (e.message ?? '')));
  //     }
  //   } catch (e) {
  //     change(null, status: RxStatus.error('catch'+e.toString()));
  //   }
  // }

  void increment() => count.value++;
}
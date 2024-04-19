import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_pinjam.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/storage_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataPinjam>>{
  //TODO: Implement PeminjamanController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(
        "${Endpoint.pinjam}/${StorageProvider.read(StorageKey.userId)}");
      if (response.statusCode == 200) {
        final ResponsePinjam responseBook = ResponsePinjam.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error(" dio ${e.response?.data['message']}"));
        }

      } else {
        change(null, status: RxStatus.error("cek" + (e.message ?? "")));
      }
    } catch (e) {
      // log("catch")
      change(null, status: RxStatus.error("catch " + e.toString()));
    }
  }
}
// import 'package:dio/dio.dart' as dio;
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/data/data/constant/endpoint.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_book.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/api_provider.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/storage_provider.dart';
//
//
// class PeminjamanController extends GetxController with StateMixin<List<DataBook>> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   // final TextEditingController user_idController = TextEditingController();
//   // final TextEditingController book_idController = TextEditingController();
//   // final TextEditingController tanggal_pinjamController = TextEditingController();
//   // final TextEditingController tanggal_kembaliController = TextEditingController();
//   // final loading = false.obs;
//
//   // final count = 0.obs;
//   var rekomendasiBookList = <DataBook>[].obs;
//   var ratingTertinggiBookList = <DataBook>[].obs;
//
//   final loading = false.obs;
//
//   final ScrollController scrollController = ScrollController();
//
//   @override
//   void onInit() {
//     super.onInit();
//     // getDetailBuku();
//
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//     getDetailBuku();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   getDetailBuku() async {
//     change(null, status: RxStatus.loading());
//     try {
//       final response = await ApiProvider.instance().get(Endpoint.book);
//       if (response.statusCode == 200) {
//         final ResponseBook responseBook = ResponseBook.fromJson(response.data);
//         if(responseBook.data!.isEmpty){
//           change(null, status: RxStatus.empty());
//         } else {
//           change(responseBook.data, status: RxStatus.success());
//         }
//       } else {
//         change(null, status: RxStatus.error('Gagal mengambil data'));
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         if (e.response?.data != null) {
//           change(null, status: RxStatus.error(" dio ${e.response?.data['message']}"));
//         }
//       } else {
//         change(null, status: RxStatus.error('cek' + (e.message ?? '')));
//       }
//     } catch (e) {
//       change(null, status: RxStatus.error('catch'+e.toString()));
//     }
//   }
//
//   // getData() async {
//   //   loading(true);
//   //   try {
//   //
//   //     final responseRekomendasi = await ApiProvider.instance().get(Endpoint.recommended);
//   //     final responseRatingTertinggi = await ApiProvider.instance().get(Endpoint.rating);
//   //
//   //     if (responseRekomendasi.statusCode == 200 && responseRatingTertinggi.statusCode == 200) {
//   //
//   //       final List<DataBook> booksRekomendasi = (responseRekomendasi.data[0]['data'] as List)
//   //           .map((json) => DataBook.fromJson(json))
//   //           .toList();
//   //
//   //       final List<DataBook> booksRatingTertinggi = (responseRatingTertinggi.data[0]['data'] as List)
//   //           .map((json) => DataBook.fromJson(json))
//   //           .toList();
//   //
//   //       rekomendasiBookList.assignAll(booksRekomendasi);
//   //       ratingTertinggiBookList.assignAll(booksRatingTertinggi);
//   //
//   //     } else {
//   //       Get.snackbar("Sorry", "Gagal Memuat Buku", backgroundColor: Colors.orange);
//   //     }
//   //     loading(false);
//   //   } catch (e) {
//   //     loading(false);
//   //     Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
//   //   }
//   // }
//
//   // addKoleksi() async {
//   //   loading(true);
//   //   try {
//   //     FocusScope.of(Get.context!).unfocus();
//   //     formKey.currentState?.save();
//   //     if (formKey.currentState!.validate()) {
//   //       final response = await ApiProvider.instance().post("${Endpoint.koleksi}/${StorageKey.userId}",
//   //           data: {
//   //             "user_id": StorageProvider.read(StorageKey.userId),
//   //             "buku_id":  int.parse(Get.parameters['id'].toString()),
//   //           });
//   //       if (response.statusCode == 200) {
//   //       } else {
//   //         Get.snackbar("Sorry", "Tambah Pinjam Gagal", backgroundColor: Colors.orange);
//   //       }
//   //     }
//   //     loading(false);
//   //   } on DioException catch (e) {
//   //     loading(false);
//   //     if (e.response != null) {
//   //       if (e.response?.data != null) {
//   //         Get.snackbar("Sorry", "${e.response?.data['message']}",
//   //             backgroundColor: Colors.orange);
//   //       }
//   //     } else {
//   //       Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
//   //     }
//   //   } catch (e) {
//   //     loading(false);
//   //     Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
//   //     print("Error, ${e.toString()}");
//   //   }
//   // }

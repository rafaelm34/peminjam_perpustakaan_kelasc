import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_pinjam.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/provider/storage_provider.dart';

class ListPeminjamanController extends GetxController with StateMixin<List<DataPinjam>>{
  var dataPinjamList = <DataPinjam>[].obs;
  //TODO: Implement ListPeminjamanController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
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
        final ResponsePinjam responseData = ResponsePinjam.fromJson(response.data);
        final List<DataPinjam> responseDataPinjam = responseData.data ?? [];
        dataPinjamList.assignAll(responseDataPinjam);
        if (responseData.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseData.data, status: RxStatus.success());
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

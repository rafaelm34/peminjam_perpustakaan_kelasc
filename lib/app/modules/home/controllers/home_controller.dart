import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/data/constant/endpoint.dart';
import '../../../data/data/model/response_book.dart';
import '../../../data/data/provider/api_provider.dart';


class HomeController extends GetxController with StateMixin<List<DataBook>>{
  late PageController pageController;
  var currentIndex = 0.obs;
  GlobalKey bottomNavigationKey = GlobalKey();
  final loading = false.obs;
  var bookList = <DataBook>[].obs;


  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    getData();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
  }


  getData() async {
    loading(true);
    change(null, status: RxStatus.loading());
    try {
      final response  = await ApiProvider.instance().get(Endpoint.book);
      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        final List<DataBook> booksTerbaru = responseBook.data ?? [];
        bookList.assignAll(booksTerbaru);
        if (responseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
      loading(false);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(
              null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  // getData() async {
  //   loading(true);
  //   change(null, status: RxStatus.loading());
  //   try {
  //     final responseTerbaru = await ApiProvider.instance().get(Endpoint.terbaru);
  //     if (responseTerbaru.statusCode == 200) {
  //       final ResponseBook responseBook = ResponseBook.fromJson(responseTerbaru.data);
  //       final List<DataBook> booksTerbaru = responseBook.data ?? [];
  //       terbaruBookList.assignAll(booksTerbaru);
  //
  //       if (responseBook.data!.isEmpty) {
  //         change(null, status: RxStatus.empty());
  //       } else {
  //         change(responseBook.data, status: RxStatus.success());
  //       }
  //     } else {
  //       change(null, status: RxStatus.error("Gagal mengambil data"));
  //     }
  //     loading(false);
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         change(
  //             null, status: RxStatus.error("${e.response?.data['message']}"));
  //       }
  //     } else {
  //       change(null, status: RxStatus.error(e.message ?? ""));
  //     }
  //   } catch (e) {
  //     change(null, status: RxStatus.error(e.toString()));
  //   }
  // }

}
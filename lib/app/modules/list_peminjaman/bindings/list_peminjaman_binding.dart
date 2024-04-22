import 'package:get/get.dart';

import '../controllers/list_peminjaman_controller.dart';

class ListPeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPeminjamanController>(
      () => ListPeminjamanController(),
    );
  }
}

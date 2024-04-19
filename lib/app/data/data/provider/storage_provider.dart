import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class StorageProvider {
  static write(key, String value) async {
    await GetStorage().write(key, value);
  }


  static String read(key) {
    try {
      return GetStorage().read(key);
    } catch (e) {
      return "";
    }
  }

  static delete(key) async {
    await GetStorage().remove(key);
  }

  static void clearAll() {
    GetStorage().erase();
    Get.toNamed(Routes.LOGIN);
  }
}


class StorageKey {
  static const String status = "status";
  static const String role = "role";
  static const String username = "username";
  static const String userId = "userId";
  static const String bukuId = "bukuId";

}
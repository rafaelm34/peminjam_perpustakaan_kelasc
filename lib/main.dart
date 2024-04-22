import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() {
  GetStorage.init();
  runApp(
    GetMaterialApp(
    debugShowCheckedModeBanner: false,
      title: "Digital Pustaka",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
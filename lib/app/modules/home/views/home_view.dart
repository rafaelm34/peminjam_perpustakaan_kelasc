import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/book/views/book_view.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/peminjaman/views/peminjaman_view.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.BOOK),
              child: Text('Buku'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
            onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
              child: Text('Peminjaman'),
            ),
          ],
        ),
      ),
    );
  }
}


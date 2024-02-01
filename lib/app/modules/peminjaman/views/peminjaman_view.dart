import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_pinjam.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PeminjamanView'),
          centerTitle: true,
        ),
        body: controller.obx(
                (state) => ListView.separated(
                itemCount: state!.length,
                itemBuilder: (context, index) {
                  DataPinjam dataPinjam = state[index];
                  return ListTile(
                    title: Text("${dataPinjam.book?.judul}"),
                    subtitle: Text(
                        "Pinjam ${dataPinjam.book?.penulis}\n${dataPinjam.book?.penerbit} - ${dataPinjam.book?.tahunTerbit}"),
                    trailing: Text("Dipinjam")
                  );
                },
                separatorBuilder: (context, index) => Divider()),
            onLoading: Center(child: CupertinoActivityIndicator())));
  }
}

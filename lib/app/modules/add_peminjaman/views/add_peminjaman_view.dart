import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.tanggalPinjamController,
                  decoration: InputDecoration(hintText: "Masukkan Tanggal Pinjam"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Tanggal tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.tanggalKembaliController,
                  decoration: InputDecoration(hintText: "Masukkan Tanggal Pengembalian"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Tanggal tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                Obx(() => controller.loading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                    onPressed: () {
                      controller.peminjaman();
                    },
                    child: Text("Pinjam"))),
              ],
            )),
      ),
    );
  }
}

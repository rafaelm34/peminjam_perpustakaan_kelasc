import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_pinjam.dart';
import 'package:peminjam_perpustakaan_kelasc/app/theme/colors.dart';

import '../controllers/list_peminjaman_controller.dart';

class ListPeminjamanView extends GetView<ListPeminjamanController> {
  const ListPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ListPeminjamanController listPeminjamanController = Get.put(ListPeminjamanController());

    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'List Peminjaman',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: main_color,
        automaticallyImplyLeading: false,
      ),
      body: Obx (() => ListView.builder(
        // scrollDirection: Axis.horizontal,
        itemCount: listPeminjamanController.dataPinjamList.length,
        itemBuilder: (context, index) {
          DataPinjam dataPinjam = listPeminjamanController.dataPinjamList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 7.0, left: 12.0, right: 12.0, bottom: 7.0),
            child: Container(
              // height: 160,
              width: 500,
              // title: Text('${dataPeminjaman.buku!.judul}'),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(141, 141, 141, 1.0),
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        width: 100,
                        height: 140,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7.0),
                          child: Image.network("${dataPinjam.buku?.image}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0, top: 12.0, bottom: 5.0),
                        child: Container(
                          width: 200,
                          // height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${dataPinjam.buku!.judul}",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Text("${dataPinjam.buku!.penulis}",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text("Tanggal Pinjam      :  ${dataPinjam.tanggalPinjam}",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 2,),
                              Text("Tanggal Kembali    :  ${dataPinjam.tanggalKembali}",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 2,),
                              // Text("NOTE : \n${dataPeminjaman.status == "DENDA"
                              //     ? "Kamu terkena denda sebesar            Rp ${dataPeminjaman.denda}"
                              //     : "Kembalikan buku pada tepat waktu"}",
                              //   style: GoogleFonts.poppins(
                              //     fontSize: 13,
                              //     // fontWeight: FontWeight.w500,
                              //     color: Colors.white,
                              //   ),
                              // ),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Container(
                          width: 95,
                          height: 25,
                          decoration: BoxDecoration(
                            color: second_color,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              "${dataPinjam.status}",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: (dataPinjam.status == 'DIPINJAM') ? Colors.white : Colors.greenAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_pinjam.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends StatelessWidget {
  const PeminjamanView({super.key});

  @override
  Widget build(BuildContext context) {
    final PeminjamanController historyPeminjamanController = Get.put(PeminjamanController());
    return Scaffold(
        backgroundColor: Color(0xFFF2F6FA),
        body: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage('assets/images/logodp1.png'),
                              height: 100,
                              width: 50,
                            ),
                            SizedBox(width: 10),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       'PerpusBersama',
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 13,
                            //         fontFamily: 'Nunito',
                            //         fontWeight: FontWeight.w800,
                            //       ),
                            //     ),
                            //     // Additional text or widgets related to 'PerpusBersama' can be added here.
                            //   ],
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                        height:
                        10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon:
                              Icon(Icons.search, color: Color(0xFF0A8159)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              // Mengatur border saat dalam keadaan fokus
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              hintText: 'Search History',
                              hintStyle: TextStyle(color: Color(0xFFD4D7D9)),
                              filled: true,
                              fillColor: Color(0xFFF7FAFC),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 5.0),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            // Tambahkan aksi tombol filter di sini
                          },
                          customBorder: CircleBorder(),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(
                                    0xFF0A8159) // Ganti dengan warna yang diinginkan
                            ),

                            child: Icon(Icons.filter_list,
                                color: Colors
                                    .white), // Ganti warna ikon jika diperlukan
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: historyPeminjamanController.obx((state) => ListView.separated(
                            itemCount: state!.length,
                            itemBuilder: (context, index){
                              DataPinjam dataPinjam = state[index];
                              return ListTile(
                                title: Text("${dataPinjam.bukuId}"),
                                // subtitle: Text("Buku: ${dataPinjam.buku?.judul}\nTanggal Pinjam: ${dataPinjam.tanggalPinjam}\nTanggal Kembali: ${dataPinjam.tanggalKembali}\nStatus: ${dataPinjam.status} "),
                              );
                            },
                            separatorBuilder: (context,index)=> Divider(),
                          ))
                      ),
                    )


                  ],
                ),
              ),
            ],
            ),
        );
    }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_book.dart';
// import 'package:peminjam_perpustakaan_kelasc/app/theme/colors.dart';
//
// import '../../../routes/app_pages.dart';
// import '../controllers/peminjaman_controller.dart';
//
// class PeminjamanView extends GetView<PeminjamanController> {
//   const PeminjamanView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final PeminjamanController peminjamanController =
//     Get.put(PeminjamanController());
//     // final PeminjamanController controller = Get.find<PeminjamanController>();
//     // final ScrollController scrollController = ScrollController();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Detail Buku',
//           style: GoogleFonts.poppins(
//             color: text_white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         // centerTitle: true,
//         backgroundColor: appbar,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: text_white,
//           ),
//           onPressed: () {
//             Get.toNamed(Routes.HOME);
//           },
//         ),
//       ),
//       backgroundColor: Color(0xFFEAEAEA),
//       body: Stack(
//         children: [
//           ListView(
//             controller: controller.scrollController,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 6, left: 5, right: 5),
//                 child: Container(
//                   width: 410,
//                   // height: 270,
//                   decoration: BoxDecoration(
//                     color: card,
//                     borderRadius: BorderRadius.circular(5.0),
//                     // border: Border.all(
//                     //   color: Color(0xFF3A3A3A),
//                     //   // Warna border yang diinginkan
//                     //   width: 1,
//                     // ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color.fromRGBO(141, 141, 141, 1.0),
//                         blurRadius: 2,
//                         offset: Offset(2, 2),
//                       )
//                     ],
//                   ),
//                   child: Padding(
//                     padding:
//                     const EdgeInsets.only(left: 10, top: 15, bottom: 12),
//                     child: Row(
//                       children: [
//                         Image.network(
//                           '${Get.parameters['image']}',
//                           width: 150,
//                           height: 215,
//                           fit: BoxFit.cover,
//                         ),
//                         const SizedBox(
//                           width: 17,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Container(
//                               width: 200,
//                               height: 190,
//                               // color: Colors.red,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Tentang Buku : ',
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: text_bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Judul Buku    :  ',
//                                         style: GoogleFonts.lato(
//                                           // fontSize: 13,
//                                           color: text_white,
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           '${Get.parameters['judul']}',
//                                           style: GoogleFonts.lato(
//                                             // fontSize: 13,
//                                             color: text_white,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Penulis            :  ',
//                                         style: GoogleFonts.lato(
//                                           // fontSize: 13,
//                                           color: text_white,
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           '${Get.parameters['penulis']}',
//                                           style: GoogleFonts.lato(
//                                             // fontSize: 13,
//                                             color: text_white,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'kategory         :   ',
//                                         style: GoogleFonts.lato(
//                                           // fontSize: 13,
//                                           color: text_white,
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           '${Get.parameters['nama_kategory']}',
//                                           style: GoogleFonts.lato(
//                                             // fontSize: 13,
//                                             color: text_white,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 15,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // controller.getDetailBuku();
//                                 Get.toNamed(
//                                   Routes.ADD_PEMINJAMAN,
//                                   parameters: {
//                                     'id': '${Get.parameters['id'].toString()}',
//                                     'judul': '${Get.parameters['judul']}',
//                                     'image': '${Get.parameters['image']}',
//                                     'penulis': '${Get.parameters['penulis']}',
//                                     'penerbit': '${Get.parameters['penerbit']}',
//                                     'tahun_terbit':
//                                     '${Get.parameters['tahun_terbit']}',
//                                     'deskripsi_buku':
//                                     '${Get.parameters['deskripsi_buku']}',
//                                     'nama_kategory':
//                                     '${Get.parameters['nama_kategory']}',
//                                     'rating': '${Get.parameters['rating']}',
//                                   },
//                                 );
//                               },
//                               child: Text("Pinjam"),
//                               style: ElevatedButton.styleFrom(
//                                 onPrimary: text_button,
//                                 primary: button_white,
//                                 textStyle: GoogleFonts.lato(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 // Sesuaikan properti lain sesuai kebutuhan
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
//                 child: LayoutBuilder(
//                   builder: (context, constraints) => Container(
//                     width: constraints.maxWidth,
//                     decoration: BoxDecoration(
//                       color: card,
//                       borderRadius: BorderRadius.circular(5.0),
//                       // border: Border.all(
//                       //   color: Color(0xFFD9D9D9),
//                       //   // Warna border yang diinginkan
//                       //   width: 1,
//                       // ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromRGBO(141, 141, 141, 1.0),
//                           blurRadius: 2,
//                           offset: Offset(2, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                               right: 10, left: 10, top: 20, bottom: 5),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Container(
//                                 width: 100,
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       'Tahun Terbit',
//                                       style: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 13,
//                                         color: text_white,
//                                       ),
//                                     ),
//                                     Text(
//                                       '${Get.parameters['tahun_terbit']}',
//                                       style: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 13,
//                                         color: text_bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width: 100,
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       'Penerbit',
//                                       style: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 13,
//                                         color: text_white,
//                                       ),
//                                     ),
//                                     Text(
//                                       '${Get.parameters['penerbit']}',
//                                       textAlign: TextAlign.center,
//                                       style: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 13,
//                                         color: text_bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width: 100,
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       'Rating',
//                                       style: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 13,
//                                         color: text_white,
//                                       ),
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.center,
//                                       children: [
//                                         Icon(
//                                           Icons.star,
//                                           color: Colors.yellow,
//                                           size: 15,
//                                         ),
//                                         // Text(
//                                         //   '${Get.parameters['rating']}',
//                                         //   style: GoogleFonts.poppins(
//                                         //     fontWeight: FontWeight.w700,
//                                         //     fontSize: 13,
//                                         //     color: text_bold,
//                                         //   ),
//                                         // ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 10),
//                           color: line,
//                           height: 0.2,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 15, right: 10, top: 5, bottom: 12),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Deskripsi Buku : ',
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: text_bold,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Padding(
//                                 padding:
//                                 const EdgeInsets.only(left: 5, right: 5),
//                                 child: ExpandableText(
//                                   text: '${Get.parameters['deskripsi_buku']}',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Expanded(
//                         //   child: Container(
//                         //     color: Colors.transparent,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.only(top: 15, left: 22, bottom: 8),
//               //   child: Text(
//               //     'Recommended',
//               //     style: GoogleFonts.poppins(
//               //       color: text_button,
//               //       fontSize: 18,
//               //       // fontWeight: FontWeight.w400,
//               //       fontWeight: FontWeight.bold,
//               //       height: 0,
//               //     ),
//               //   ),
//               // ),
//               // Obx(
//               //       () => controller.loading.value
//               //       ? Center(child: CircularProgressIndicator())
//               //       : Padding(
//               //     padding: const EdgeInsets.only(
//               //         left: 8, right: 8, bottom: 20),
//               //     child: Container(
//               //       height: 240,
//               //       decoration: BoxDecoration(
//               //         color: card,
//               //         borderRadius: BorderRadius.circular(5.0),
//               //         boxShadow: [
//               //           BoxShadow(
//               //             color: Color.fromRGBO(141, 141, 141, 1.0),
//               //             blurRadius: 2,
//               //             offset: Offset(2, 2),
//               //           ),
//               //         ],
//               //       ),
//               //       // color: card,
//               //       // decoration: BoxDecoration(
//               //       //   borderRadius: BorderRadius.circular(5.0),
//               //       // ),
//               //       child: ListView.builder(
//               //         scrollDirection: Axis.horizontal,
//               //         itemCount:
//               //         peminjamanController.rekomendasiBookList.length,
//               //         itemBuilder: (context, index) {
//               //           DataBook dataBook = peminjamanController
//               //               .rekomendasiBookList[index];
//               //           return BookCover(
//               //             bookTitle: '${dataBook.judul}',
//               //             bookImage: '${dataBook.image}',
//               //             onPressed: () {
//               //               Get.toNamed(Routes.PEMINJAMAN, parameters: {
//               //                 'id': (dataBook.bukuId ?? 0).toString(),
//               //                 'judul': '${dataBook.judul}',
//               //                 'image': '${dataBook.image}',
//               //                 'penulis': '${dataBook.penulis}',
//               //                 'penerbit': '${dataBook.penerbit}',
//               //                 'tahun_terbit': '${dataBook.tahunTerbit}',
//               //                 'deskripsi_buku': '${dataBook.deskripsi_buku}',
//               //                 // 'kategorybuku_id': '${dataBook.kategorybuku_id}',
//               //                 'nama_kategory': '${dataBook.namaKategory}',
//               //                 'rating': '${dataBook.rating}',
//               //               });
//               //             },
//               //           );
//               //         },
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//           // Positioned(
//           //   bottom: 20,
//           //   right: 15,
//           //   child: Form(
//           //     key: controller.formKey,
//           //     child: InkWell(
//           //       onTap: (){
//           //         controller.addKoleksi();
//           //       },
//           //       child: Container(
//           //         width: 60,
//           //         height: 60,
//           //         decoration: BoxDecoration(
//           //           shape: BoxShape.circle,
//           //           color: button_white,
//           //           boxShadow: [
//           //             BoxShadow(
//           //               color: Color.fromRGBO(141, 141, 141, 1.0),
//           //               blurRadius: 1,
//           //               offset: Offset(1, 1),
//           //             ),
//           //           ],
//           //         ),
//           //         child: Center(
//           //           child: Icon(
//           //             Iconsax.save_2,
//           //             color: text_button,
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           // Positioned(
//           //   bottom: 20,
//           //   right: 15,
//           //   child: Obx(
//           //     () => AnimatedOpacity(
//           //       opacity: controller.isScrollingDown.value ? 0.0 : 1.0,
//           //       duration: Duration(milliseconds: 300),
//           //       child: GestureDetector(
//           //         onTap: () {
//           //           // Button action
//           //         },
//           //         child: Container(
//           //           width: 60,
//           //           height: 60,
//           //           decoration: BoxDecoration(
//           //             shape: BoxShape.circle,
//           //             color: button_white,
//           //             boxShadow: [
//           //               BoxShadow(
//           //                 color: Color.fromRGBO(141, 141, 141, 1.0),
//           //                 blurRadius: 1,
//           //                 offset: Offset(1, 1),
//           //               ),
//           //             ],
//           //           ),
//           //           child: Center(
//           //             child: Icon(
//           //               Iconsax.save_2,
//           //               color: text_button,
//           //             ),
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
//
// class ExpandableText extends StatefulWidget {
//   final String text;
//   final int maxLines;
//
//   ExpandableText({
//     required this.text,
//     this.maxLines = 7,
//   });
//
//   @override
//   _ExpandableTextState createState() => _ExpandableTextState();
// }
//
// class _ExpandableTextState extends State<ExpandableText> {
//   bool _isExpanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         AnimatedCrossFade(
//           duration: const Duration(milliseconds: 300),
//           crossFadeState: _isExpanded
//               ? CrossFadeState.showSecond
//               : CrossFadeState.showFirst,
//           firstChild: Text(
//             widget.text,
//             maxLines: widget.maxLines,
//             overflow: TextOverflow.ellipsis,
//             style: GoogleFonts.lato(
//               fontSize: 15,
//               color: text_white,
//             ),
//           ),
//           secondChild: Text(
//             widget.text,
//             style: GoogleFonts.lato(
//               fontSize: 15,
//               color: text_white,
//             ),
//           ),
//         ),
//         SizedBox(height: 8),
//         if (_isExpanded || _isOverMaxLines())
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 _isExpanded = !_isExpanded;
//               });
//             },
//             child: Text(
//               _isExpanded ? 'Show Less' : 'Show More',
//               style: TextStyle(
//                 color: text_bold,
//                 fontSize: 13,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
//
//   bool _isOverMaxLines() {
//     final TextPainter textPainter = TextPainter(
//       maxLines: widget.maxLines,
//       text: TextSpan(
//         text: widget.text,
//         style: TextStyle(
//           fontSize: 14.0,
//           color: Colors.black,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     )..layout(maxWidth: MediaQuery.of(context).size.width);
//
//     return textPainter.didExceedMaxLines;
//   }
// }
//
// class BookCover extends StatelessWidget {
//   final String bookTitle;
//   final String bookImage;
//   final VoidCallback onPressed;
//
//   const BookCover({
//     Key? key,
//     required this.bookTitle,
//     required this.bookImage,
//     required this.onPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 1),
//       child: GestureDetector(
//         onTap: onPressed,
//         child: SizedBox(
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
//             child: Container(
//               // width: 125,
//               // color: Colors.white,
//               decoration: BoxDecoration(
//                 color: button_white,
//                 borderRadius: BorderRadius.circular(2.0),
//                 //     boxShadow: [
//                 //   BoxShadow(
//                 //     color: Color.fromRGBO(141, 141, 141, 1.0),
//                 //     blurRadius: 2,
//                 //     offset: Offset(2, 2),
//                 //   ),
//                 // ]
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(2.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.network(
//                       bookImage,
//                       width: 130,
//                       height: 180,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (BuildContext context, Widget child,
//                           ImageChunkEvent? loadingProgress) {
//                         if (loadingProgress == null) {
//                           return child;
//                         } else {
//                           return Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded /
//                                   loadingProgress.expectedTotalBytes!
//                                   : null,
//                             ),
//                           );
//                         }
//                       },
//                       errorBuilder: (BuildContext context, Object exception,
//                           StackTrace? stackTrace) {
//                         return Center(
//                           child: Icon(
//                             Icons.error_outline,
//                             color: Colors.red,
//                             size: 40,
//                           ),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 6),
//                     Container(
//                       width: 120,
//                       height: 30,
//                       // color: Colors.red,
//                       child: Text(
//                         bookTitle,
//                         textAlign: TextAlign.center,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: GoogleFonts.poppins(
//                           fontSize: 12,
//                           color: text_button,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

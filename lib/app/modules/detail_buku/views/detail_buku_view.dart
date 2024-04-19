import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/detail_buku/controllers/detail_buku_controller.dart';
import 'package:peminjam_perpustakaan_kelasc/app/theme/colors.dart';

import '../../../routes/app_pages.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailBukuController detailBukuController =
    Get.put(DetailBukuController());
    final DetailBukuController controller = Get.find<DetailBukuController>();
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Buku',
          style: GoogleFonts.poppins(
            color: text_white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: main_color,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: text_white,
          ),
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
        ),
      ),
      backgroundColor: Color(0xFFEAEAEA),
      body: Stack(
        children: [
          ListView(
            controller: controller.scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 5, right: 5),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: card,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(141, 141, 141, 1.0),
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15, bottom: 12),
                    child: Row(
                      children: [
                        Image.network(
                          '${Get.parameters['image']}',
                          width: 150,
                          height: 215,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 200,
                              height: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tentang Buku : ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: text_bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Judul Buku    :  ',
                                        style: GoogleFonts.lato(
                                          color: text_white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${Get.parameters['judul']}',
                                          style: GoogleFonts.lato(
                                            color: text_white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Penulis            :  ',
                                        style: GoogleFonts.lato(
                                          color: text_white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${Get.parameters['penulis']}',
                                          style: GoogleFonts.lato(
                                            color: text_white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed(
                                  Routes.ADD_PEMINJAMAN,
                                  parameters: {
                                    'id': '${Get.parameters['buku_id'].toString()}',
                                    'judul': '${Get.parameters['judul']}',
                                    'image': '${Get.parameters['image']}',
                                    'penulis': '${Get.parameters['penulis']}',
                                    'penerbit': '${Get.parameters['penerbit']}',
                                    'tahun_terbit': '${Get.parameters['tahun_terbit']}',
                                    'deskripsi_buku': '${Get.parameters['deskripsi_buku']}',
                                    'nama_kategory': '${Get.parameters['nama_kategory']}',
                                    'rating': '${Get.parameters['rating']}',
                                  },
                                );
                              },
                              child: Text("Pinjam"),
                              style: ElevatedButton.styleFrom(
                                onPrimary: text_button,
                                primary: button_white,
                                textStyle: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: card,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(141, 141, 141, 1.0),
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              right: 10, left: 10, top: 20, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      'Tahun Terbit',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: text_white,
                                      ),
                                    ),
                                    Text(
                                      '${Get.parameters['tahun_terbit']}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: text_bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      'Penerbit',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: text_white,
                                      ),
                                    ),
                                    Text(
                                      '${Get.parameters['penerbit']}',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: text_bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      'Rating',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: text_white,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 15,
                                        ),
                                        Text(
                                          '${Get.parameters['rating']}',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                            color: text_bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          color: line,
                          height: 0.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 5, bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deskripsi Buku : ',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: text_bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 5, right: 5),
                                child: ExpandableText(
                                  text: '${Get.parameters['deskripsi_buku']}',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  ExpandableText({
    required this.text,
    this.maxLines = 7,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Text(
            widget.text,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lato(
              fontSize: 15,
              color: text_white,
            ),
          ),
          secondChild: Text(
            widget.text,
            style: GoogleFonts.lato(
              fontSize: 15,
              color: text_white,
            ),
          ),
        ),
        SizedBox(height: 8),
        if (_isExpanded || _isOverMaxLines())
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'Show Less' : 'Show More',
              style: TextStyle(
                color: text_bold,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  bool _isOverMaxLines() {
    final TextPainter textPainter = TextPainter(
      maxLines: widget.maxLines,
      text: TextSpan(
        text: widget.text,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    return textPainter.didExceedMaxLines;
  }
}


class BookCover extends StatelessWidget {
  final String bookTitle;
  final String bookImage;
  final VoidCallback onPressed;

  const BookCover({
    Key? key,
    required this.bookTitle,
    required this.bookImage,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1),
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            child: Container(
              // width: 125,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: button_white,
                borderRadius: BorderRadius.circular(2.0),
                //     boxShadow: [
                //   BoxShadow(
                //     color: Color.fromRGBO(141, 141, 141, 1.0),
                //     blurRadius: 2,
                //     offset: Offset(2, 2),
                //   ),
                // ]
              ),
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      bookImage,
                      width: 130,
                      height: 180,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 40,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 120,
                      height: 30,
                      // color: Colors.red,
                      child: Text(
                        bookTitle,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: text_button,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
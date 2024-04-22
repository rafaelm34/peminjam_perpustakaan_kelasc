import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        centerTitle: true,
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
                    color: main_color,
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
                    padding:
                        const EdgeInsets.only(left: 10, top: 15, bottom: 12),
                    child: Row(
                      children: [
                        Image.network(
                          '${Get.parameters['image']}',
                          width: 130,
                          height: 190,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 170,
                              height: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tentang Buku : ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: text_white,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tahun Terbit :  ',
                                        style: GoogleFonts.lato(
                                          color: text_white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${Get.parameters['tahun_terbit']}',
                                          style: GoogleFonts.lato(
                                            color: text_white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Penerbit         :  ',
                                        style: GoogleFonts.lato(
                                          color: text_white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${Get.parameters['penerbit']}',
                                          style: GoogleFonts.lato(
                                            color: text_white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rating             :  ',
                                        style: GoogleFonts.lato(
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
                                            style: GoogleFonts.lato(
                                              color: text_white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
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
                      color: Colors.blueGrey,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Deskripsi Buku',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          color: Colors.black,
                          height: 0.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 5, bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
          Positioned(
            bottom: 25.0,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Pinjam',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: main_color,
                  minimumSize: Size(250, 60),
                ),
              ),
            ),
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

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

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
            onTap: _toggleExpanded,
            child: Text(
              _isExpanded ? 'Show Less' : 'Show More',
              style: TextStyle(
                color: second_color,
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

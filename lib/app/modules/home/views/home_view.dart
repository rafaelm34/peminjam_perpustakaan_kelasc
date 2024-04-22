import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:peminjam_perpustakaan_kelasc/app/data/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/list_peminjaman/views/list_peminjaman_view.dart';
import 'package:peminjam_perpustakaan_kelasc/app/modules/profile/controllers/profile_controller.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';
import 'package:peminjam_perpustakaan_kelasc/app/theme/colors.dart';

import '../../profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    return HomeViewStful();
  }
}

class HomeViewStful extends StatefulWidget {
  @override
  State<HomeViewStful> createState() => _HomeViewStfulState();
}


class _HomeViewStfulState extends State<HomeViewStful> {
  int _currentPageIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  List<Widget> pageViewModel() {
    return [
      screenHome(),
      ListPeminjamanView(),
      ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: pageViewModel(),
      ),
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
        backgroundColor: Color(0xFFFFFFFF),
        indicatorColor: Colors.transparent,
        selectedIndex: _currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.black),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.library_books, color: Colors.black),
            icon: Icon(Icons.library_books_rounded),
            label: 'History',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2, color: Colors.black),
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class screenHome extends StatelessWidget {
  const screenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
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
                          image: AssetImage('assets/images/logodp2.png'),
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.person),
                          onPressed: () {
                            Get.toNamed(Routes.PROFILE);
                          },
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
                          Icon(Icons.search, color: second_color),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          // Mengatur border saat dalam keadaan fokus
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: main_color),
                          ),
                          hintText: 'Search Book',
                          hintStyle: TextStyle(color: Color(0xFFD4D7D9)),
                          filled: true,
                          fillColor: Color(0xFFF7FAFC),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 5.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: CarouselSlider(
              items: [
                Image.asset('assets/images/bumi.png', fit: BoxFit.cover),
                Image.asset('assets/images/sebuahseni.png', fit: BoxFit.cover),
                Image.asset('assets/images/tuhanadadihatimu.png', fit: BoxFit.cover),
              ],
              options: CarouselOptions(
                height: 150.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: HexColor('#F5F5F5'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                'Teratas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => homeController.loading.value
                    ? Center(child: CircularProgressIndicator())
                    : Row(
                  children: List.generate(
                    homeController.bookList!.length,
                        (index) {
                      DataBook dataBook = homeController.bookList[index];
                      return InkWell(
                        onTap: () => Get.toNamed(Routes.DETAIL_BUKU, parameters: {
                          'id': (dataBook.bukuId ?? 0).toString(),
                          'judul': '${dataBook.judul}',
                          'image': '${dataBook.image}',
                          'penulis': '${dataBook.penulis}',
                          'penerbit': '${dataBook.penerbit}',
                          'tahun_terbit': '${dataBook.tahunTerbit}',
                          'deskripsi_buku': '${dataBook.deskripsi_buku}',
                          // 'nama_kategory': '${dataBook.namaKategory}',
                          'rating': '${dataBook.rating}',
                          'genre': '${dataBook.genre}',
                        }),
                        child: Container(
                          width: 120,
                          height: 250,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      dataBook.image!,
                                      height: 150,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "${dataBook.judul}",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15,
                                    ),
                                    Text(
                                      '${dataBook.rating}',
                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ),
              )],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: HexColor('#F5F5F5'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                'Rekomendasi Buku',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Wrap(
                  spacing: 15.0,
                  runSpacing: 4.0,
                  children: [
                    ActionChip(
                      backgroundColor: HexColor('#286291'),
                      label: Text('Majalah', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        // Add your logic here.
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Memberikan border radius
                      ),
                    ),
                    ActionChip(
                      backgroundColor: HexColor('#286291'),
                      label: Text('Buku', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        // Add your logic here.
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Memberikan border radius
                      ),
                    ),
                    ActionChip(
                      backgroundColor: HexColor('#286291'),
                      label: Text('Komik', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        // Add your logic here.
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Memberikan border radius
                      ),
                    ),
                    ActionChip(
                      backgroundColor: HexColor('#286291'),
                      label: Text('Novel', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        // Add your logic here.
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Memberikan border radius
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => homeController.loading.value
                    ? Center(child: CircularProgressIndicator())
                    : Row(
                  children: List.generate(
                    homeController.bookList!.length,
                        (index) {
                      DataBook dataBook = homeController.bookList[index];
                      return InkWell(
                        onTap: () => Get.toNamed('/detail-buku?id=${dataBook.bukuId ?? 0}'),
                        child: Container(
                          width: 120,
                          height: 250,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      dataBook.image!,
                                      height: 150,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "${dataBook.judul}",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15,
                                    ),
                                    Text(
                                      '${dataBook.rating}',
                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ),
              )],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

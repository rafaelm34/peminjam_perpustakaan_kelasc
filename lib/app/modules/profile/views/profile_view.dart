import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';
import 'package:peminjam_perpustakaan_kelasc/app/theme/colors.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.poppins(
              color: text_white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          backgroundColor: main_color,
          automaticallyImplyLeading: false, // Menyembunyikan tombol panah kembali
        ),
        backgroundColor: background,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset("assets/images/bgprofile.jpg"),
                ),
                Center(
                  heightFactor: 2,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/profile.png"),
                      ),
                      SizedBox(height: 5),
                      Text(
                        controller.username.value,
                        style: GoogleFonts.lato(
                            color: text_white,
                            fontWeight: FontWeight.w800,
                            fontSize: 15
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "PEMINJAM",
                        style: GoogleFonts.poppins(
                          color: text_white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            // ListTile(
            //   leading: Icon(Iconsax.receipt, color: text_button),
            //   title: Text(
            //     "List Peminjaman",
            //     style: GoogleFonts.lato(
            //       color: main_color,
            //     ),
            //   ),
            //   onTap: () {
            //     Get.toNamed(Routes.LIST_PEMINJAMAN);
            //   },
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   // Sesuaikan dengan ukuran padding yang diinginkan
            //   child: Divider(
            //     thickness: 1.0, // Ubah ketebalan garis
            //     color: Colors.grey, // Ubah warna garis
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(Iconsax.receipt_search, color: text_button),
            //   title: Text(
            //     "Riwayat Peminjaman",
            //     style: GoogleFonts.lato(
            //       color: main_color,
            //     ),
            //   ),
            //   onTap: () {
            //     Get.toNamed(Routes.RIWAYAT_PEMINJAMAN);
            //   },
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   // Sesuaikan dengan ukuran padding yang diinginkan
            //   child: Divider(
            //     thickness: 1.0, // Ubah ketebalan garis
            //     color: Colors.grey, // Ubah warna garis
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(Iconsax.save_2, color: text_button),
            //   title: Text(
            //     "Koleksi",
            //     style: GoogleFonts.lato(
            //       color: main_color,
            //     ),
            //   ),
            //   onTap: () {
            //     Get.toNamed(Routes.KOLEKSI);
            //   },
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              // Sesuaikan dengan ukuran padding yang diinginkan
              child: Divider(
                thickness: 1.0, // Ubah ketebalan garis
                color: Colors.grey, // Ubah warna garis
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: text_button),
              title: Text(
                "Logout",
                style: GoogleFonts.lato(
                  color: main_color,
                ),
              ),
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ));
  }
}

void _showLogoutConfirmationDialog(BuildContext context) {
  final ProfileController controller = Get.find<ProfileController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Logout',
          style: GoogleFonts.poppins(
            color: text_bold,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: text_white,
        content: Text(
          'Apakah Anda yakin ingin logout?',
          style: GoogleFonts.poppins(
            color: card,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: Text(
              'Batal',
              style: GoogleFonts.poppins(
                color: text_bold,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Lakukan logout jika pengguna mengkonfirmasi
              controller.logout();
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: Text(
              'Logout',
              style: GoogleFonts.poppins(
                color: text_bold,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    },
  );
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:peminjam_perpustakaan_kelasc/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  'assets/images/logodp.png',
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "LOGIN", // Teks "Login"
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold, color: HexColor('#286291')
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            hintText: "Masukkan Username",
                            prefixIcon: Icon(Icons.person), // Ikon di samping input field username
                          ),
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Username tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Obx(() => TextFormField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            hintText: "Masukkan Password",
                            prefixIcon: Icon(Icons.lock), // Ikon di samping input field password
                            suffixIcon: IconButton(
                              icon: Icon(controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                // Panggil fungsi togglePasswordVisibility ketika tombol "eye" ditekan
                                controller.togglePasswordVisibility();
                              },
                            ),
                          ),
                          obscureText: !controller.isPasswordVisible.value, // Sembunyikan atau tampilkan password berdasarkan status isPasswordVisible
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Password tidak boleh kosong";
                            }
                            return null;
                          },
                        )),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Get.toNamed(Routes.REGISTER),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                "Lupa Password?",
                                style: TextStyle(
                                  color: HexColor('#286291'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Obx(() => controller.loading.value
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                            onPressed: () {
                              controller.login();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: HexColor('#286291'),
                              minimumSize: Size(double.infinity, 50),
                            ),
                            child: Text("Login"))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Belum punya akun? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () => Get.toNamed(Routes.REGISTER),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                "Daftar sekarang",
                                style: TextStyle(
                                  color: HexColor('#286291'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )],
          ),
        ),
      ),
    );
  }
}
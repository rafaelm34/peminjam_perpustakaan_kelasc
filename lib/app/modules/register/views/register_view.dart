import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Form(
  //           key: controller.formKey,
  //           child: Column(
  //             children: [
  //               TextFormField(
  //                 controller: controller.usernameController,
  //                 decoration: InputDecoration(hintText: "Masukkan Nama"),
  //                 validator: (value) {
  //                   if (value!.length < 2) {
  //                     return "Nama tidak boleh kosong";
  //                   }
  //                   return null;
  //                 },
  //               ),
  //               TextFormField(
  //                 controller: controller.namaController,
  //                 decoration: InputDecoration(hintText: "Masukkan Username"),
  //                 validator: (value) {
  //                   if (value!.length < 2) {
  //                     return "Username tidak boleh kosong";
  //                   }
  //                   return null;
  //                 },
  //               ),TextFormField(
  //                 controller: controller.telpController,
  //                 decoration: InputDecoration(hintText: "Masukkan Telp"),
  //                 validator: (value) {
  //                   if (value!.length < 2) {
  //                     return "Telp tidak boleh kosong";
  //                   }
  //                   return null;
  //                 },
  //               ),TextFormField(
  //                 controller: controller.alamatController,
  //                 decoration: InputDecoration(hintText: "Masukkan Alamat"),
  //                 validator: (value) {
  //                   if (value!.length < 2) {
  //                     return "Alamat tidak boleh kosong";
  //                   }
  //                   return null;
  //                 },
  //               ),TextFormField(
  //                 controller: controller.passwordController,
  //                 decoration: InputDecoration(hintText: "Masukkan Password"),
  //                 validator: (value) {
  //                   if (value!.length < 2) {
  //                     return "Password tidak boleh kosong";
  //                   }
  //                   return null;
  //                 },
  //               ),
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
                          "REGISTER", // Teks "Login"
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
                            hintText: "Masukkan Nama", prefixIcon: Icon(Icons.person)),
                        validator: (value) {
                          if (value!.length < 2) {
                            return "Nama tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: controller.namaController,
                        decoration:
                            InputDecoration(
                              hintText: "Masukkan Username",
                              prefixIcon: Icon(Icons.person),),
                        validator: (value) {
                          if (value!.length < 2) {
                            return "Username tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: controller.telpController,
                        decoration: InputDecoration(
                          hintText: "Masukkan Telp",
                          prefixIcon: Icon(Icons.call),),
                        validator: (value) {
                          if (value!.length < 2) {
                            return "Telp tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: controller.alamatController,
                        decoration:
                            InputDecoration(
                              hintText: "Masukkan Alamat",
                              prefixIcon: Icon(Icons.home),),
                        validator: (value) {
                          if (value!.length < 2) {
                            return "Alamat tidak boleh kosong";
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
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Sudah punya akun? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed(Routes.LOGIN),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              "Masuk sekarang",
                              style: TextStyle(
                                color: HexColor('#286291'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Obx(() => controller.loading.value
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                          onPressed: () {
                            controller.register();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HexColor('#286291'),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text("Register"))),
                      SizedBox(height: 10),
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

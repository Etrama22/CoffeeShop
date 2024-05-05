// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeShopHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan kerangka dasar untuk tata letak visual Material Design.
    return Scaffold(
      // Container sebagai elemen pembungkus yang dapat dikustomisasi.
      body: Container(
        // Mengatur warna latar belakang Container.
        color: Color.fromARGB(222, 1, 1, 1),
        // Stack memungkinkan penumpukan widget secara bertumpuk.
        child: Stack(
          children: [
            // Image.asset digunakan untuk memuat dan menampilkan gambar dari assets.
            Image.asset(
              'assets/bg.png',
              fit: BoxFit
                  .cover, // Mengatur gambar agar menutupi seluruh ruang yang tersedia.
              width: MediaQuery.of(context)
                  .size
                  .width, // Lebar gambar sesuai lebar layar.
              height: MediaQuery.of(context)
                  .size
                  .height, // Tinggi gambar sesuai tinggi layar.
            ),
            // Positioned mengatur posisi widget anak di dalam Stack.
            Positioned(
              top: 60, // Jarak dari atas.
              left: 0,
              right: 0,
              // Padding memberikan jarak di dalamnya.
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                // Center untuk menengahkan widget anaknya.
                child: Center(
                  // Column untuk menata widget secara vertikal.
                  child: Column(
                    children: [
                      // Text menampilkan string teks.
                      Text(
                        'Coffee Shop.',
                        textAlign: TextAlign.center, // Teks rata tengah.
                        // Menggunakan GoogleFonts untuk styling teks.
                        style: GoogleFonts.pacifico(
                          fontSize: 50, // Ukuran font.
                          color:
                              Color.fromARGB(255, 255, 255, 255), // Warna teks.
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20, // Jarak dari bawah.
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'The best grain, the finest roast, the powerful flavor',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          color: Colors.white
                              .withOpacity(0.5), // Warna teks dengan opasitas.
                        ),
                      ),
                      SizedBox(
                          height:
                              20), // Box dengan tinggi tertentu untuk jarak.
                      ElevatedButton(
                        onPressed: () {
                          // Navigator untuk navigasi antar halaman.
                          Navigator.pushNamed(context, '/menu');
                        },
                        // Styling untuk ElevatedButton.
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(
                              255, 26, 125, 25), // Warna latar tombol.
                        ),
                        child: Container(
                          // Padding di dalam Container.
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50),
                          // Teks di dalam tombol.
                          child: Text(
                            'View Menu',
                            style: GoogleFonts.notoSerif(
                                color: Colors.white), // Styling teks.
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

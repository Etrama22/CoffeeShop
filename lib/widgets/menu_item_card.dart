// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:coffee_shop/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;

  // Konstruktor untuk menginisialisasi MenuItemCard dengan MenuItem yang diperlukan.
  const MenuItemCard({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget Padding digunakan untuk memberikan jarak di sekeliling Card.
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // Widget Card digunakan untuk menampilkan konten dalam bentuk kartu dengan bayangan.
      child: Card(
        color: Colors.grey[900], // Warna latar belakang kartu.
        elevation: 4, // Ketinggian bayangan kartu.
        // Widget Column digunakan untuk menata widget anak secara vertikal.
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Menengahkan anak-anak secara vertikal.
          crossAxisAlignment: CrossAxisAlignment
              .center, // Menengahkan anak-anak secara horizontal.
          children: [
            // Widget Expanded digunakan untuk memperluas anaknya untuk mengisi ruang yang tersedia.
            Expanded(
              // Widget Image.asset digunakan untuk menampilkan gambar dari aset.
              child: Image.asset(
                menuItem.image,
                fit: BoxFit
                    .cover, // Mengatur gambar agar sesuai dengan ruang yang tersedia.
              ),
            ),
            // Padding tambahan di sekitar teks nama dan harga.
            Padding(
              padding: EdgeInsets.all(8.0),
              // Kolom tambahan untuk teks nama dan harga.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Menengahkan teks secara horizontal.
                children: [
                  // Widget Text untuk menampilkan nama item menu.
                  Text(
                    menuItem.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white), // Gaya teks untuk nama.
                  ),
                  // Widget Text untuk menampilkan harga item menu.
                  Text(
                    menuItem.price,
                    style:
                        TextStyle(color: Colors.grey), // Gaya teks untuk harga.
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

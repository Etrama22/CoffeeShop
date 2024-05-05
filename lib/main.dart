// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last

import 'package:coffee_shop/screens/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/screens/coffee_shop_home_page.dart';
import 'package:coffee_shop/screens/menu_page.dart';

void main() {
  runApp(MyApp());
}

// Fungsi main() digunakan untuk menjalankan aplikasi dengan widget MyApp sebagai root widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah widget yang mengatur navigasi dan theming di aplikasi Flutter.
    return MaterialApp(
      home:
          CoffeeShopHomePage(), // Halaman utama yang ditampilkan saat aplikasi dijalankan.
      initialRoute: '/home', // Rute awal yang diatur saat aplikasi dimulai.
      routes: {
        '/home': (context) =>
            CoffeeShopHomePage(), // Rute ke halaman utama Coffee Shop.
        '/menu': (context) =>
            MenuPage(), // Rute ke halaman menu di mana pengguna dapat melihat item menu.
        '/cart': (context) =>
            CartPage(), // Rute ke halaman keranjang belanja di mana pengguna dapat melihat item yang telah ditambahkan.
      },
    );
  }
}

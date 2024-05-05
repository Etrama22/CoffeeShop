// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<String, int> cartItems = {};
  Map<String, String> itemPrices = {};
  int totalHarga = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    print(
        "Arguments received: $arguments"); // Debugging: Cetak argumen yang diterima
    if (arguments != null) {
      setState(() {
        cartItems = arguments['itemCounts'] as Map<String, int>;
        itemPrices = arguments['itemPrices'] as Map<String, String>;
        totalHarga =
            _calculateTotal(); // Memanggil fungsi untuk menghitung total harga
      });
    }
  }

  int _calculateTotal() {
    int total = 0;
    cartItems.forEach((key, value) {
      int price = int.parse(
          itemPrices[key]!); // Pastikan bahwa itemPrices[key] tidak null
      total += value *
          price; // Menghitung subtotal untuk setiap item dan menambahkannya ke total
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // Filter cartItems untuk hanya menyertakan item dengan jumlah lebih dari 0
    var itemsToDisplay =
        cartItems.entries.where((entry) => entry.value > 0).toList();

    return Scaffold(
      backgroundColor: Colors.black, // Mengubah background menjadi hitam
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Keranjang Belanja',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itemsToDisplay.length,
              itemBuilder: (context, index) {
                var key = itemsToDisplay[index].key;
                var count = itemsToDisplay[index].value;
                var price = itemPrices[key];
                return ListTile(
                  title: Text(key), // Menampilkan nama item
                  subtitle: Text(
                      'Jumlah: $count, Harga: $price'), // Menampilkan jumlah dan harga per item
                  trailing: Text(
                      'Subtotal: ${count * int.parse(price!)}'), // Menampilkan subtotal harga untuk item tersebut
                  textColor: Colors.white, // Mengatur warna teks menjadi putih
                );
              },
            ),
          ),
          Divider(), // Garis pemisah
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga:', // Teks label untuk total harga
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp.$totalHarga', // Menampilkan total harga
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Pesanan berhasil!'), // Teks notifikasi bahwa pesanan berhasil
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Text(
              'Pesan Sekarang', // Teks pada tombol
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color.fromARGB(255, 255, 145, 0), // Warna latar tombol
              padding: EdgeInsets.symmetric(
                  horizontal: 50, vertical: 20), // Padding tombol
              textStyle: TextStyle(fontSize: 18), // Ukuran teks tombol
            ),
          ),
        ],
      ),
    );
  }
}

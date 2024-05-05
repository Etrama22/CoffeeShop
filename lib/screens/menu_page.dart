// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_shop/models/menu_item.dart';
import 'package:coffee_shop/widgets/menu_item_card.dart';

// StatefulWidget yang memungkinkan pembuatan halaman menu yang dinamis.
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

// State untuk MenuPage yang mengelola state dari menu item.
class _MenuPageState extends State<MenuPage> {
  // List dari MenuItem yang menyimpan data menu yang tersedia.
  final List<MenuItem> menuItems = [
    MenuItem(
      image: 'assets/Black Coffee.png',
      name: 'Americano',
      price: '13636',
      description: 'Kopi hitam klasik yang kuat dan penuh aroma.',
    ),
    MenuItem(
      image: 'assets/Cold Coffee.png',
      name: 'Cappucino',
      price: '13636',
      description: 'Kopi dengan busa susu yang tebal dan nikmat.',
    ),
    MenuItem(
      image: 'assets/Espresso.png',
      name: 'Espresso',
      price: '12272',
      description: 'Kopi pekat untuk menambah energi di pagi hari.',
    ),
    MenuItem(
      image: 'assets/Latte.png',
      name: 'Latte',
      price: '15000',
      description: 'Kopi dengan susu yang lembut dan creamy.',
    ),
    MenuItem(
      image: 'assets/Macchiato.png',
      name: 'Macchiato',
      price: '15000',
      description: 'espresso dengan sedikit busa dan susu.',
    ),
    MenuItem(
      image: 'assets/Vietnam Drip.png',
      name: 'Vietnam Drip',
      price: '13636',
      description: 'Kopi vietnam drip dengan rasa yang kaya dan manis.',
    ),
  ];

  // Map untuk menghitung jumlah item yang dipilih oleh pengguna.
  Map<String, int> itemCounts = {};
  // Map untuk menyimpan harga dari setiap item.
  Map<String, String> itemPrices = {};

  @override
  void initState() {
    super.initState();
    // Inisialisasi itemCounts dan itemPrices berdasarkan menuItems.
    for (var item in menuItems) {
      itemCounts[item.name] = 0;
      itemPrices[item.name] = item.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar tata letak Material Design.
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.density_medium_rounded),
          iconSize: 35,
          color: Colors.white,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_checkout_rounded),
            iconSize: 35,
            color: Colors.white,
            onPressed: () {
              // Navigasi ke halaman keranjang dengan data itemCounts dan itemPrices.
              Navigator.pushNamed(context, '/cart', arguments: {
                'itemCounts': itemCounts,
                'itemPrices': itemPrices
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'List Menu',
              style: GoogleFonts.laila(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.grey[900],
                      context: context,
                      builder: (context) => StatefulBuilder(
                        builder:
                            (BuildContext context, StateSetter setStateModal) {
                          return Container(
                            padding: EdgeInsets.all(20),
                            height: 350,
                            child: Column(
                              children: [
                                Image.asset(menuItems[index].image,
                                    height: 100),
                                Text(menuItems[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                Text(menuItems[index].price,
                                    style: TextStyle(color: Colors.grey)),
                                Text(menuItems[index].description,
                                    style: TextStyle(color: Colors.white)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        setStateModal(() {
                                          if (itemCounts[
                                                  menuItems[index].name]! >
                                              1) {
                                            itemCounts[menuItems[index].name] =
                                                itemCounts[menuItems[index]
                                                        .name]! -
                                                    1;
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                        itemCounts[menuItems[index].name]
                                            .toString(),
                                        style: TextStyle(color: Colors.white)),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setStateModal(() {
                                          itemCounts[menuItems[index].name] =
                                              itemCounts[
                                                      menuItems[index].name]! +
                                                  1;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(
                                      Icons.shopping_cart_checkout_rounded),
                                  iconSize: 35,
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/cart',
                                        arguments: {
                                          'itemCounts': itemCounts,
                                          'itemPrices': itemPrices
                                        });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: MenuItemCard(menuItem: menuItems[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

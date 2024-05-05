class MenuItem {
  // `image` adalah string yang menyimpan path ke gambar item menu.
  final String image;
  // `name` adalah string yang menyimpan nama item menu.
  final String name;
  // `price` adalah string yang menyimpan harga item menu.
  final String price;
  // `description` adalah string yang menyimpan deskripsi dari item menu.
  final String description;

  // Konstruktor untuk class `MenuItem` yang membutuhkan semua field di atas sebagai parameter yang wajib.
  MenuItem({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
}

# uts_arika
## Flutter + Cubit — Aplikasi Kasir & Sistem Diskon  
*Nama:* Arika Azhar  
*NIM:* 23552011408  



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


📱 UTS Pemrograman Mobile 2
Flutter + Cubit — Aplikasi Kasir & Sistem Diskon

Nama: Arika Azhar
NIM: 23552011408

📌 Deskripsi Project

Project ini merupakan aplikasi kasir berbasis Flutter yang menggunakan State Management Cubit untuk mengelola menu, keranjang belanja, harga, dan sistem diskon dinamis.
Aplikasi dibuat sebagai tugas UTS Pemrograman Mobile 2.

## 🧠 1. Manfaat State Management Cubit dalam Logika Diskon Dinamis

Cubit sangat membantu dalam aplikasi kasir karena transaksi terus berubah: jumlah item, harga, dan diskon dapat berubah kapan saja.

✔ Mengelola Data Secara Konsisten

Setiap perubahan seperti menambah item, mengurangi jumlah, memperbarui total, atau menghitung diskon dilakukan melalui Cubit.
UI otomatis mengikuti perubahan state tanpa harus meng-update secara manual.

✔ Logika Diskon Terpusat

Contoh logika diskon yang disimpan rapi dalam Cubit:

int getTotalPrice() {
  int total = 0;

  for (var m in state) {
    total += m.getDiscountedPrice() * m.qty;
  }

  if (total > 100000) {
    total = (total * 0.9).toInt(); // Diskon 10%
  }

  return total;
}

✔ Keuntungan Menggunakan Cubit

Logika diskon tidak bercampur dengan UI

Risiko bug lebih kecil

Struktur project lebih bersih

Memisahkan logic dan UI (clean architecture)

## 💸 2. Perbedaan Diskon Per Item dan Diskon Total Transaksi
⭐ Diskon Per Item

Diskon diterapkan pada setiap menu tertentu.
Contoh:

Ayam Geprek diskon 10%

Es Teh potongan Rp 2.000

Contoh kode harga setelah diskon:

int getDiscountedPrice() {
  return price - discount;
}

⭐ Diskon Total Transaksi

Diskon diberikan setelah total harga semua item dihitung.
Contoh:

Total belanja > 100.000 → diskon 10%

Promo akhir bulan → diskon 5%

if (total > 100000) {
  total = (total * 0.9).toInt();
}

⭐ Tabel Ringkasan
Diskon Per Item	Diskon Total
Berlaku per produk	Berlaku untuk total belanja
Dihitung sebelum total	Dihitung setelah total
Cocok untuk promo menu	Cocok untuk promo toko
## 🧱 3. Manfaat Widget Stack untuk Tampilan Kategori Menu

Widget Stack digunakan untuk menumpuk widget sehingga tampilan kategori menjadi lebih menarik dan modern.

✔ Menumpuk Banyak Elemen

Contoh elemen:

gambar background kategori

judul kategori

badge promo

icon kecil

✔ Penempatan Fleksibel

Dengan Positioned, elemen bisa ditempatkan di mana saja:
kiri atas, kanan bawah, tengah overlay, dll.

✔ Cocok untuk Informasi Tambahan

Seperti:

Promo 20%

Best Seller

Stok Habis

📌 Contoh Kode Stack
Stack(
  children: [
    Image.asset("assets/foods.png"),
    Positioned(
      bottom: 8,
      left: 10,
      child: Text(
        "Makanan",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
    Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Promo 20%", style: TextStyle(color: Colors.white)),
      ),
    ),
  ],
);

## 🛠 Teknologi yang Digunakan

Flutter 3.x

Dart

Flutter Bloc (Cubit)

Material Design

Widget Flutter: Stack, GridView, ListView, Card

📁 Struktur Project (Versi Rapi & Standar Flutter)
lib/
│
├── main.dart
│
├── cubit/
│   └── order_cubit.dart
│
├── models/
│   └── menu_model.dart
│
├── pages/
│   ├── home_page.dart
│   ├── cart_page.dart
│   ├── order_summary_page.dart
│   └── category_page.dart
│
├── widgets/
│   ├── menu_card.dart
│   └── category_card.dart
│
└── utils/
    └── format_currency.dart

📌 Penjelasan Singkat Tiap Folder
📌 lib/main.dart

Tempat root aplikasi, inisialisasi Cubit & route.

📦 cubit/

Tempat semua state management, misalnya:

order_cubit.dart — mengatur keranjang, qty, harga, diskon.

📦 models/

Tempat semua data model, misalnya:

menu_model.dart — struktur data menu + diskon item.

📦 pages/

Halaman utama aplikasi:

home_page.dart → daftar menu

cart_page.dart → keranjang

order_summary_page.dart → ringkasan transaksi

category_page.dart → tampilan kategori menggunakan Stack

📦 widgets/

Semua widget reusable:

menu_card.dart → card menu

category_card.dart → card kategori dengan Stack

📦 utils/

Helper / fungsi kecil:

format_currency.dart → memformat harga ke bentuk Rupiah
🎯 Kesimpulan

Cubit membantu mengolah transaksi & diskon secara efisien dan rapi.

Diskon per item dan diskon total memiliki fungsi berbeda namun dapat digunakan bersamaan.

Widget Stack membuat tampilan kategori lebih profesional dan menarik.

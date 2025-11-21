📱 UTS Pemrograman Mobile 2
Flutter + Cubit — Aplikasi Kasir & Sistem Diskon

Nama: Arika Azhar
NIM: 23552011408


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


📌 Deskripsi Project

Aplikasi ini merupakan aplikasi kasir berbasis Flutter yang menggunakan State Management Cubit untuk mengelola:

menu makanan

keranjang belanja

harga

diskon per item

diskon total transaksi

Project ini dibuat sebagai tugas UTS Pemrograman Mobile 2.

## 🧠 1. Manfaat Cubit dalam Logika Diskon Dinamis

Cubit sangat membantu dalam aplikasi kasir karena transaksi memiliki data yang berubah-ubah: jumlah item, harga, diskon, dan total pembayaran.

✔ Konsistensi Data

Semua perubahan seperti:

menambah item

mengurangi jumlah

menghitung total harga

menghitung diskon

dilakukan di Cubit, sehingga UI otomatis update tanpa coding ulang di halaman.

✔ Logika Diskon Terpusat

Semua perhitungan disatukan sehingga kode bersih & aman dari bug.

📌 Contoh Logika Diskon di Cubit
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

Logika diskon tidak bercampur UI

Risiko bug lebih kecil

Struktur project lebih bersih

Mengikuti prinsip Clean Architecture

## 💸 2. Perbedaan Diskon Per Item & Diskon Total Transaksi
⭐ Diskon Per Item

Diskon yang diterapkan ke setiap produk secara individual.
Contoh:

Ayam Geprek diskon 10%

Es Teh potongan Rp 2.000

Contoh kode:

int getDiscountedPrice() {
  return price - discount;
}

⭐ Diskon Total Transaksi

Diskon diberikan setelah total harga seluruh item dihitung.
Contoh:

Total belanja > 100.000 → diskon 10%

Promo toko: diskon total 5%

if (total > 100000) {
  total = (total * 0.9).toInt();
}

📊 Ringkasan Perbedaan
Diskon Per Item	Diskon Total
Berlaku per produk	Berlaku untuk seluruh belanja
Dihitung sebelum total	Dihitung setelah total
Cocok untuk promo menu	Cocok untuk promo toko
Harga per item berubah	Total akhir berubah
## 🧱 3. Manfaat Widget Stack untuk Tampilan Kategori Menu

Widget Stack membuat UI terlihat profesional dan modern.

✔ Menumpuk Beberapa Elemen

Digunakan untuk:

gambar background

teks kategori

badge promo

ikon overlay

✔ Penempatan Lebih Fleksibel

Dengan Positioned, elemen bisa ditempatkan di:

kiri atas

kanan bawah

tengah overlay

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

Material Design Components

Widget: Stack, GridView, ListView, Card

## 📁 Struktur Project (Rapi & Standar Flutter)
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

## 📌 Penjelasan Setiap Folder
📌 lib/main.dart

Root aplikasi: inisialisasi Cubit + route utama.

📦 cubit/

Folder untuk semua state management:

order_cubit.dart → menghitung total harga, diskon, qty, dll.

📦 models/

Berisi struktur data aplikasi:

menu_model.dart → data menu + diskon item.

📦 pages/

Halaman tampilan aplikasi:

home_page.dart

cart_page.dart

order_summary_page.dart

category_page.dart

📦 widgets/

Widget kecil yang dapat digunakan kembali:

menu_card.dart

category_card.dart

📦 utils/

Helper function:

format_currency.dart → ubah harga menjadi format Rupiah.

🎯 Kesimpulan

Cubit membuat pengelolaan transaksi & diskon menjadi lebih rapi, stabil, dan mudah dikembangkan.

Diskon per item dan diskon total transaksi memiliki fungsi berbeda namun bisa dipakai bersamaan.

Widget Stack memberi tampilan kategori yang lebih modern dan informatif.

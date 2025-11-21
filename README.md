# uts_arika

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# uts_arika

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


📱 UTS Pemrograman Mobile 2 – Aplikasi Kasir Flutter

Nama: Arika Azhar
NIM: 23552011408

📝 Deskripsi Project

Aplikasi ini merupakan proyek UTS Pemrograman Mobile 2 yang dibuat menggunakan Flutter dan State Management Cubit.
Aplikasi ini memiliki fitur:

Manajemen menu & kategori

Keranjang belanja

Sistem diskon per item

Sistem diskon total transaksi

Tampilan kategori menggunakan widget Stack

Perhitungan harga secara otomatis

🔧 1. Bagaimana State Management Cubit Membantu Logika Diskon Dinamis?

State management menggunakan Cubit sangat cocok untuk aplikasi kasir karena transaksi selalu berubah (tambah item, ubah qty, hapus item).

✔ Mengelola Perubahan Secara Real-Time

Setiap kali pengguna menambahkan atau mengubah jumlah item, Cubit langsung:

meng-update state,

menghitung total ulang,

menghitung diskon ulang.

UI akan menyesuaikan otomatis tanpa harus mengatur ulang secara manual.

✔ Logika Diskon Lebih Rapi dan Terpusat

Cubit menyimpan semua logika diskon dalam satu file.
Ini membuat kode lebih mudah dibaca, terstruktur, dan minim bug.

📌 Contoh Logika Diskon di OrderCubit
int getTotalPrice() {
  int total = 0;

  // Hitung diskon per item
  for (var item in state) {
    total += item.getDiscountedPrice() * item.qty;
  }

  // Diskon total transaksi
  if (total > 100000) {
    total = (total * 0.9).toInt(); // diskon 10%
  }

  return total;
}


Dengan ini, UI tidak perlu tahu cara menghitung diskon → cukup panggil getTotalPrice().

💸 2. Perbedaan Diskon Per Item dan Diskon Total Transaksi
⭐ Diskon Per Item

Diskon diberikan langsung pada menu tertentu.
Contoh:

Nasi Goreng diskon 10%

Es Teh potongan 2.000

Diskon ini dihitung sebelum masuk total transaksi.

Contoh kode:
int getDiscountedPrice() {
  return price - discount;
}

⭐ Diskon Total Transaksi

Diskon diberikan setelah total harga barang dijumlahkan.
Contoh:

Total belanja > 100.000 → diskon 10%

Promo akhir bulan → diskon 5%

Contoh kode:
if (total > 100000) {
  total = (total * 0.9).toInt();
}

📊 Tabel Ringkasan
Jenis Diskon	Berlaku Pada	Contoh	Waktu Penghitungan
Diskon Per Item	per produk	Ayam Geprek 10%	sebelum total
Diskon Total	total belanja	total > 100.000 → 10%	setelah total
🎨 3. Manfaat Widget Stack pada Tampilan Kategori Menu

Widget Stack digunakan untuk menumpuk widget sehingga tampilan UI kategori lebih menarik dan modern.

✔ Menempatkan Elemen Secara Bebas

Dengan Positioned, elemen dapat diletakkan di:

kiri atas,

kanan bawah,

tengah overlay, dll.

✔ Membuat UI Lebih Menarik

Stack sangat cocok digunakan untuk:

background kategori

teks kategori

badge promo (contoh: “20% OFF”)

ikon kecil

📌 Contoh Stack
Stack(
  children: [
    Image.asset("assets/foods.png"),
    Positioned(
      bottom: 8,
      left: 10,
      child: Text("Makanan", 
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

📁 Struktur Project
lib/
 ├── blocs/
 │    └── order_cubit.dart
 │    └── category_cubit.dart
 ├── models/
 │    └── menu_model.dart
 ├── pages/
 │    ├── home_page.dart
 │    ├── cart_page.dart
 │    ├── order_summary_page.dart
 │    └── category_stack_page.dart
 ├── widgets/
 │    └── menu_card.dart
 └── main.dart

🚀 Cara Menjalankan Project
flutter pub get
flutter run

🎯 Kesimpulan

Cubit membantu mengatur transaksi dan diskon dengan lebih bersih & efisien.

Diskon per item dan diskon total transaksi memiliki fungsi berbeda namun saling melengkapi.

Widget Stack membuat tampilan kategori lebih estetik dan fleksibel.



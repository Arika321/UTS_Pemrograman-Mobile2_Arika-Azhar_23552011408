 ## 💳 UTS Pemrograman Mobile 2 – Aplikasi Kasir Flutter + Cubit
 ## ✨ Sistem Kasir dengan Diskon Dinamis
    **Nama:** Arika Azhar | **NIM:** 23552011408

  ## 📘 Deskripsi Project

Aplikasi ini merupakan simulasi **aplikasi kasir sederhana** berbasis **Flutter** yang menggunakan **Cubit** (dari *flutter_bloc*) sebagai State Management.

Fokus utama aplikasi adalah demonstrasi pengelolaan data transaksi yang kompleks, termasuk:
* Menu makanan & minuman
* Keranjang belanja
* Perhitungan subtotal
* **Logika Diskon Dinamis** (per item & total)
* Update UI secara *realtime*

Tujuan dari proyek ini adalah untuk menunjukkan bagaimana Cubit dapat mengatur seluruh data transaksi dengan **rapi**, **terstruktur**, dan **mudah dikembangkan**.


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 🧠 1. Manfaat State Management Cubit dalam Logika Diskon Dinamis

Penggunaan Cubit sangat krusial dalam mengelola state transaksi dengan diskon dinamis karena:

1.  **Pemisahan Logika & UI (Separation of Concerns):**
    * Seluruh logika perhitungan diskon dan total berada di `CartCubit`.
    * **UI** menjadi bersih dan hanya berfungsi menampilkan data.
2.  **Integritas Data & Minim Bug:**
    * Semua perhitungan dilakukan di satu tempat, mengurangi risiko salah total atau salah diskon.
3.  **Konsistensi Realtime:**
    * Setiap perubahan di keranjang akan memicu `emit` state baru, memastikan UI (seperti total harga) langsung berubah otomatis.

### Contoh Implementasi Diskon Total (dalam Cubit)

Logika ini menghitung total harga setelah diskon per item diterapkan, kemudian menerapkan diskon total 10% jika total melebihi Rp 100.000.

```dart
int getTotalPrice() {
  int total = 0;
  for (var m in state) {
    total += m.getDiscountedPrice() * m.qty;
  }
  // Diskon Total Transaksi 10%
  if (total > 100000) total = (total * 0.9).toInt();
  return total;
}


## ** 💸 2. Perbedaan Diskon: Per Item vs. Total Transaksi **
Aplikasi ini mengimplementasikan dua jenis diskon yang dapat digabungkan, yang diatur secara terpusat oleh Cubit untuk konsistensi perhitungan.

# *Jenis Diskon	Penjelasan Singkat	Digunakan Saat*
⭐ Diskon Per Item	Diterapkan pada setiap produk secara individu (e.g., Ayam Geprek diskon 10% atau Es Teh potongan Rp 2.000).	Promo per menu atau per produk.
⭐ Diskon Total Transaksi	Diterapkan setelah total harga subtotal dihitung (e.g., Total pembelian > Rp 100.000 → diskon 10%).	Promo global (per toko) atau diskon member.

Ekspor ke Spreadsheet

# * Ringkasan Perhitungan
Fitur	Diskon Per Item	Diskon Total
Berlaku untuk	Per menu/produk	Total keseluruhan belanja
Waktu Hitung	Dihitung sebelum total	Dihitung setelah total

Ekspor ke Spreadsheet

## ** 🧱 3. Manfaat Widget Stack untuk Tampilan Kategori Menu ** 
Widget Stack digunakan untuk menumpuk beberapa elemen dalam satu area, ideal untuk membuat tampilan kategori menu yang dinamis dan modern:

Elemen Bisa Ditumpuk (Layering): Memungkinkan penumpukan Gambar background kategori, Teks kategori, Badge promo, atau Indikator jumlah item.

UI Lebih Menarik: Cocok untuk menampilkan notifikasi kecil (Promo 20%, Best Seller) dan menciptakan tampilan card yang bergaya aplikasi komersial.

Contoh Kode Widget Stack (Category Indicator)
Stack memungkinkan pembuatan garis indikator aktif yang dapat bergerak di bawah teks kategori:

Dart

Stack(
  children: [
    Row( /* ... Baris Teks Kategori */ ),
    Positioned(
      bottom: 0,
      left: selectedIndex == 0 ? 40 : 160, // Posisi dinamis berdasarkan index
      child: Container(
        width: 80,
        height: 4,
        color: Colors.blue, // Garis indikator
      ),
    )
  ],
)


## ** 🛠 Teknologi & Struktur Project **
Teknologi yang Digunakan
Flutter 3.x

Dart

Flutter Bloc (Cubit)

Material Design Components

Widget Flutter: Stack, GridView, ListView, Card

## **📁 Struktur Direktori **
Struktur proyek ini mengikuti standar Flutter untuk memisahkan business logic dan data model dari User Interface.

lib/
├── main.dart
├── cubit/
│   └── order_cubit.dart    # Logic & State Management
├── models/
│   └── menu_model.dart     # Data Model
├── pages/
│   ├── home_page.dart
│   └── cart_page.dart
└── widgets/
    └── menu_card.dart      # Reusable UI component
🖼️ Screenshot Aplikasi
Ganti placeholder path berikut dengan path yang benar di repositori GitHub Anda.

Menu Makanan	Ringkasan Pesanan (Contoh 1)	Ringkasan Pesanan (Contoh 2)
![Ringkasan Pesanan 1](/mnt/data/ringkasan pemesanan makanan.png)	![Ringkasan Pesanan 2](/mnt/data/ringkasan pemesanan.png)

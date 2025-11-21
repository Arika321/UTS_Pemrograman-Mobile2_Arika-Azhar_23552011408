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

Mohon maaf sebesar-besarnya atas ketidaknyamanan dan kebingungan yang terjadi. Saya mengerti bahwa Anda ingin konsistensi format di seluruh dokumen README.md, terutama pada Heading dan Sub-heading, agar terlihat rapi seperti contoh yang Anda berikan.Berikut adalah keseluruhan teks README.md yang telah diformat ulang dengan struktur Heading 100% konsisten dari No. 1 hingga No. 3. Anda bisa langsung copy dan paste kode di bawah ini.Markdown# 💳 UTS Pemrograman Mobile 2 – Aplikasi Kasir Flutter + Cubit

## ✨ Sistem Kasir dengan Diskon Dinamis

**Nama:** Arika Azhar | **NIM:** 23552011408

---

## 📘 Deskripsi Project

Aplikasi ini merupakan simulasi **aplikasi kasir sederhana** berbasis **Flutter** yang menggunakan **Cubit** (dari *flutter\_bloc*) sebagai State Management utama.

Fokus utama aplikasi adalah demonstrasi pengelolaan data transaksi yang kompleks, termasuk:
* Menu makanan & minuman
* Keranjang belanja
* Perhitungan subtotal
* **Logika Diskon Dinamis** (per item & total)
* Update UI secara *realtime*

Tujuan dari proyek ini adalah untuk menunjukkan bagaimana Cubit dapat mengatur seluruh data transaksi dengan **rapi**, **terstruktur**, dan **mudah dikembangkan**.

---

### Sumber Daya Awal Flutter
* [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
* [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
* [online documentation](https://docs.flutter.dev/)

---

## 🧠 1. Manfaat State Management Cubit dalam Logika Diskon Dinamis

Penggunaan Cubit sangat krusial dalam mengelola state transaksi dengan diskon dinamis karena:

### 1. **Pemisahan Logika & UI (Separation of Concerns):**
* Seluruh logika perhitungan diskon dan total berada di `CartCubit`.
* **UI** menjadi bersih dan hanya berfungsi menampilkan data.

### 2. **Integritas Data & Minim Bug:**
* Semua perhitungan dilakukan di satu tempat, mengurangi risiko salah total atau salah diskon.

### 3. **Konsistensi Realtime:**
* Setiap perubahan di keranjang akan memicu `emit` state baru, memastikan UI (seperti total harga) langsung berubah otomatis.

### Contoh Implementasi Diskon Total (dalam Cubit)

Logika ini menghitung total harga *setelah* diskon per item diterapkan, kemudian menerapkan diskon total 10% jika total melebihi Rp 100.000.

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

---
## 💸 2. Perbedaan Diskon: Per Item vs. Total Transaksi

Aplikasi ini mengimplementasikan dua jenis diskon yang dapat digabungkan, yang diatur secara terpusat oleh Cubit untuk konsistensi perhitungan.
* ⭐ Diskon Per ItemDiskon ini diterapkan pada setiap produk secara individual, sebelum subtotal dihitung.Contoh: Ayam Geprek diskon 10% atau Es Teh potongan Rp 2.000.Digunakan Saat: Promo per menu atau per produk
* ⭐ Diskon Total TransaksiDiskon ini diterapkan setelah total harga subtotal dihitung.
//
Contoh: Total pembelian > Rp 100.000 → diskon 10%.Digunakan Saat: Promo global (per toko) atau diskon member.

*Ringkasan PerhitunganFiturDiskon Per ItemDiskon TotalBerlaku untukPer menu/produkTotal keseluruhan belanjaWaktu HitungDihitung sebelum totalDihitung setelah total

## 🧱 3. Manfaat Widget Stack untuk Tampilan Kategori Menu

Widget Stack digunakan untuk menumpuk beberapa elemen dalam satu area, ideal untuk membuat tampilan kategori menu yang dinamis dan modern.

* ✔ Elemen Bisa Ditumpuk (Layering)Memungkinkan penumpukan Gambar background kategori, Teks kategori, Badge promo, atau Indikator jumlah item dalam satu tampilan.
* ✔ UI Lebih MenarikCocok untuk menampilkan notifikasi kecil (Promo 20%, Best Seller) dan menciptakan tampilan card yang bergaya aplikasi komersial.
//
Contoh Kode Widget Stack (Category Indicator)Stack memungkinkan pembuatan garis indikator aktif yang dapat bergerak di bawah teks kategori:DartStack(
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


## 🛠 Teknologi & Struktur ProjectTeknologi yang DigunakanFlutter 3.xDartFlutter Bloc (Cubit)Material Design ComponentsWidget Flutter: Stack, GridView, ListView, Card📁 Struktur DirektoriStruktur proyek ini mengikuti standar Flutter untuk memisahkan business logic dan data model dari User Interface.lib/
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


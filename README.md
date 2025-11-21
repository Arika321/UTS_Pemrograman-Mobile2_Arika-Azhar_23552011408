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


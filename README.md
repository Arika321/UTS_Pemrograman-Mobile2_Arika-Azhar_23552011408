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


)

📱 UTS Pemrograman Mobile 2
Aplikasi Kasir Flutter + Cubit — Sistem Diskon Dinamis

Nama: Arika Azhar
NIM: 23552011408

🚀 Tentang Project

Aplikasi ini merupakan aplikasi kasir sederhana berbasis Flutter dengan State Management Cubit untuk mengelola:

Menu makanan & minuman

Keranjang belanja

Harga & quantity

Diskon per item

Diskon total transaksi

Ringkasan transaksi

Aplikasi ini dibuat sebagai tugas UTS Pemrograman Mobile 2.

📸 Tampilan Aplikasi (Screenshots)
🧾 Ringkasan Pesanan (Contoh 1)

![ui1](/mnt/data/ringkasan pemesanan makanan.png)

🧾 Ringkasan Pesanan (Contoh 2)

![ui2](/mnt/data/ringkasan pemesanan.png)

🍹 Menu Minuman

🍛 Menu Makanan

🧠 1. Manfaat Cubit dalam Logika Diskon Dinamis

Cubit membantu mengelola data transaksi yang selalu berubah seperti:

Qty item

Harga setelah diskon

Total transaksi

Subtotal

✔ Konsistensi Data

Semua perubahan dilakukan di Cubit → UI otomatis ter-update.

✔ Logika Diskon Terpusat

Tidak bercampur dengan UI → lebih bersih & minim bug.

📌 Contoh Logika Diskon Total
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

💸 2. Perbedaan Diskon Per Item & Diskon Total
⭐ Diskon Per Item

Diterapkan pada produk tertentu.
Contoh:

Ayam Geprek → diskon 10%

Es Teh → potongan Rp 2.000

int getDiscountedPrice() {
  return price - discount;
}

⭐ Diskon Total

Diterapkan setelah subtotal dihitung.
Contoh:

if (total > 100000) {
  total = (total * 0.9).toInt(); // Diskon 10%
}

📊 Ringkasan
Diskon Per Item	Diskon Total
Berlaku per menu	Berlaku untuk seluruh belanja
Diterapkan sebelum total	Setelah total
Cocok untuk promo per produk	Cocok untuk promo toko
🧱 3. Manfaat Widget Stack untuk UI Kategori Menu

Stack digunakan untuk membuat UI modern seperti:

Background kategori

Nama kategori

Label promo

Badge

📌 Contoh
Stack(
  children: [
    Image.asset("assets/foods.png"),
    Positioned(bottom: 8, left: 10, child: Text("Makanan")),
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

🛠 Teknologi yang Digunakan

Flutter 3.x

Dart

Flutter Bloc (Cubit)

Material Design

Widget: Stack, ListView, GridView, Card

📁 Struktur Project (Rapi & Standar Flutter)
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

🎯 Kesimpulan

Cubit sangat efektif mengelola diskon dan transaksi.

Diskon item & diskon total punya fungsi berbeda dan dapat digabung.

Widget Stack membuat tampilan kategori lebih modern.

Struktur project rapi dan mudah dikembangkan.

Kalau kamu mau, aku bisa buatkan versi README dengan styling lebih profesional:

✨ pakai banner
✨ gradient header
✨ badge GitHub
✨ tombol demo
✨ tabel fitur
✨ screenshot grid layout

# 💳 UTS Pemrograman Mobile 2 – Aplikasi Kasir Flutter + Cubit

**Nama:** Arika Azhar  
**NIM:** 23552011408  

---

# 📘 Deskripsi Project

Project ini adalah aplikasi **Kasir Flutter** dengan **State Management Cubit (flutter_bloc)**.  
Aplikasi ini memiliki fitur utama:

- Menu makanan & minuman  
- Keranjang belanja  
- Perhitungan otomatis  
- Diskon per item  
- Diskon total transaksi  
- UI realtime menggunakan Cubit  

Tujuan project ini adalah menunjukkan bagaimana Cubit dapat mengelola data transaksi dengan **rapi, mudah dikembangkan, dan minim bug.**

---

# 🧠 1. Manfaat Cubit dalam Logika Diskon Dinamis

## ✔ 1. Memisahkan Logika dan UI  
Semua logika diskon & total tersimpan di CartCubit, sehingga UI tetap bersih.

## ✔ 2. Update Realtime  
Cubit melakukan `emit()` state baru setiap ada perubahan sehingga UI otomatis ter-update.

## ✔ 3. Minim bug  
Karena semua perhitungan dilakukan di satu tempat.

---

# 💸 2. Perbedaan Diskon Per Item dan Diskon Total

## ⭐ Diskon Per Item
- Diterapkan pada masing-masing menu  
- Dihitung sebelum subtotal  
- Contoh: Latte harga 20.000 diskon 10% → 18.000

## ⭐ Diskon Total Transaksi
- Dihitung setelah subtotal  
- Contoh: Jika total > 100.000 → diskon 10%

---

# 🧱 3. Manfaat Widget Stack untuk Tampilan Kategori

Widget `Stack` digunakan untuk membuat tampilan kategori modern:

- Layer teks + gambar  
- Badge promo  
- Indikator kategori aktif  

Contoh penggunaan:

```dart
Stack(
  children: [
    Row(
      children: [
        Text("Coffee"),
        SizedBox(width: 30),
        Text("Foods"),
      ],
    ),
    Positioned(
      bottom: 0,
      left: 40,
      child: Container(
        width: 60,
        height: 4,
        color: Colors.blue,
      ),
    )
  ],
)

## ** 📦 4. Struktur Folder Project
lib/
│
├── cubit/
│   ├── cart_cubit.dart
│   └── cart_state.dart
│
├── models/
│   └── menu_model.dart
│
├── pages/
│   ├── home_page.dart
│   └── cart_page.dart
│
├── widgets/
│   ├── menu_card.dart
│   └── quantity_button.dart
│
└── main.dart

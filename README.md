 ## 💳 UTS Pemrograman Mobile 2 – Aplikasi Kasir Flutter + Cubit
    Sistem Diskon Dinamis, Menu Makanan & Minuman, Keranjang Belanja

     Nama: Arika Azhar
     NIM: 23552011408



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

📘 Deskripsi Project

Aplikasi ini merupakan aplikasi kasir sederhana berbasis Flutter, yang menggunakan State Management Cubit untuk mengelola:

Menu makanan & minuman

Keranjang belanja

Perhitungan subtotal

Diskon per item & diskon total

Logika diskon dinamis

Update UI secara realtime

Tujuan aplikasi ini adalah untuk menampilkan bagaimana Cubit mengatur seluruh data transaksi, sehingga proses perhitungan menjadi lebih rapi, terstruktur, dan mudah dikembangkan.

🧠 Manfaat Cubit dalam Logika Diskon Dinamis

State management Cubit membantu mengelola transaksi yang memiliki diskon dinamis melalui:

✔ 1. Pemisahan Logika & UI

Seluruh logika perhitungan subtotal, diskon, dan total berada di Cubit, sehingga UI bersih dan mudah dipelihara.

✔ 2. Update UI Secara Realtime

Saat item ditambah/hapus, Cubit mengirim state baru sehingga UI langsung berubah otomatis.

✔ 3. Perhitungan Diskon Mudah Diubah

Jika syarat diskon berubah, cukup ubah di Cubit tanpa menyentuh UI.

✔ 4. Mencegah Perhitungan Ganda

Semua perhitungan terpusat → tidak ada selisih angka di halaman lain.

🔍 Contoh Logika Diskon Dinamis di Cubit
double get subtotal {
  return cart.fold(0, (sum, item) => sum + item.finalPrice);
}

double get total {
  if (subtotal > 100000) {
    return subtotal * 0.9; // Diskon 10%
  }
  return subtotal;
}

💸 Perbedaan Diskon Per Item dan Diskon Total Transaksi
Jenis Diskon	Penjelasan	Contoh	Digunakan Saat
Diskon Per Item	Diskon diterapkan di produk tertentu sebelum subtotal dihitung.	Kopi Rp20.000 → diskon 10% → Rp18.000	Promo barang tertentu
Diskon Total Transaksi	Diskon diberikan berdasarkan total belanja.	Subtotal Rp120.000 → diskon 10%	Diskon member, minimal pembelian
📌 Contoh Implementasi
Diskon per Item (per-produk)
class Item {
  final String name;
  final double price;
  final double discount; // contoh: 0.1 = 10%

  Item({required this.name, required this.price, this.discount = 0});

  double get finalPrice => price - (price * discount);
}

Diskon Total Transaksi (foreach transaksi)
double get total {
  if (subtotal > 100000) {
    return subtotal * 0.9; // potong 10%
  }
  return subtotal;
}

🧩 Manfaat Penggunaan Widget Stack pada Tampilan Kategori Menu

Widget Stack memberikan kelebihan untuk tampilan kategori seperti tab menu.

✔ 1. Menumpuk Widget (Layering)

Membuat tampilan garis bawah aktif di belakang teks kategori.

✔ 2. Lebih Fleksibel untuk Desain Modern

Dapat menambah highlight, bayangan, atau indikator tanpa mengubah layout utama.

✔ 3. Cocok untuk Animasi Category Indicator

Garis indikator dapat digerakkan dari kategori "Makanan" ke "Minuman".

🔍 Contoh Kode Widget Stack
Stack(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Makanan"),
        Text("Minuman"),
      ],
    ),
    Positioned(
      bottom: 0,
      left: selectedIndex == 0 ? 40 : 160,
      child: Container(
        width: 80,
        height: 4,
        color: Colors.blue,
      ),
    )
  ],
)

🛒 Komponen Utama Aplikasi Kasir
No	Komponen	Deskripsi
1	Menu Makanan & Minuman	Menampilkan daftar lengkap produk
2	Keranjang Belanja	Item yang dipilih user
3	Perhitungan Subtotal	Total harga sebelum diskon
4	Diskon Per Item	Diskon berdasarkan item tertentu
5	Diskon Total Transaksi	Diskon jika subtotal memenuhi syarat
6	Cubit State Management	Mengatur seluruh perubahan data
📦 Struktur Cubit
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cart: []));

  void addItem(Item item) {
    state.cart.add(item);
    emit(CartState(cart: List.from(state.cart)));
  }

  double get subtotal => state.cart.fold(0, (a, b) => a + b.finalPrice);

  double get total {
    if (subtotal > 100000) return subtotal * 0.9;
    return subtotal;
  }
}

🖼️ Screenshot Menu Makanan

Tambahkan gambar (yang tadi kamu upload) dengan kode berikut:

![Menu Makanan](/mnt/data/makanan.png)


Jika gambar sudah dipindahkan ke folder proyek GitHub:

![Menu Makanan](assets/images/makanan.png)

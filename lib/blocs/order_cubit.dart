import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/menu_model.dart';

class OrderCubit extends Cubit<List<MenuModel>> {
  OrderCubit() : super([]);

  /// Menambahkan pesanan
  void addToOrder(MenuModel menu) {
    // Cek apakah item sudah ada di pesanan
    final existing = state.where((m) => m.id == menu.id);

    if (existing.isEmpty) {
      // Jika belum ada → tambahkan dengan qty = 1
      emit([...state, menu.copyWith(qty: 1)]);
    } else {
      // Jika sudah ada → update qty + 1
      updateQuantity(menu, existing.first.qty + 1);
    }
  }

  /// Menghapus item dari pesanan
  void removeFromOrder(MenuModel menu) {
    emit(state.where((m) => m.id != menu.id).toList());
  }

  /// Update qty item pesanan
  void updateQuantity(MenuModel menu, int qty) {
    if (qty <= 0) {
      removeFromOrder(menu);
      return;
    }

    emit(
      state.map((m) {
        if (m.id == menu.id) {
          return m.copyWith(qty: qty);
        }
        return m;
      }).toList(),
    );
  }

  /// Subtotal tanpa diskon transaksi (tapi tetap pakai diskon per item)
  int getSubtotal() {
    int subtotal = 0;
    for (var m in state) {
      subtotal += m.getDiscountedPrice() * m.qty;
    }
    return subtotal;
  }

  /// Cek apakah berhak diskon transaksi 10%
  bool hasBigDiscount() {
    return getSubtotal() > 100000;
  }

  /// Total setelah diskon transaksi
  int getTotalAfterTransactionDiscount() {
    int subtotal = getSubtotal();
    if (subtotal > 100000) {
      return (subtotal * 0.9).toInt();
    }
    return subtotal;
  }

  /// Menghitung total harga setelah diskon per item
  int getTotalPrice() {
    int total = 0;

    for (var m in state) {
      // Ambil harga setelah diskon dari MenuModel
      total += m.getDiscountedPrice() * m.qty;
    }

    return total;
  }

  /// Menghapus semua pesanan
  void clearOrder() {
    emit([]);
  }
}

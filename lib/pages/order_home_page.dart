// lib/pages/order_home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/menu_model.dart';
import '../blocs/order_cubit.dart';
import 'order_summary_page.dart';
import 'category_stack_page.dart';

class OrderHomePage extends StatelessWidget {
  const OrderHomePage({super.key});

  List<MenuModel> sampleMenu() {
    return [
      MenuModel(
        id: 'm1',
        name: 'Nasi Goreng',
        price: 20000,
        category: 'Makanan',
        discount: 0.1,
      ),
      MenuModel(
        id: 'm2',
        name: 'Ayam Goreng',
        price: 25000,
        category: 'Makanan',
        discount: 0.05,
      ),
      MenuModel(
        id: 'd1',
        name: 'Es Teh',
        price: 5000,
        category: 'Minuman',
        discount: 0.0,
      ),
      MenuModel(
        id: 'd2',
        name: 'Kopi',
        price: 12000,
        category: 'Minuman',
        discount: 0.15,
      ),
      // tambahkan produk lain kalau perlu
    ];
  }

  @override
  Widget build(BuildContext context) {
    final menuList = sampleMenu();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Warung Sederhana'),
        actions: [
          BlocBuilder<OrderCubit, List<MenuModel>>(
            builder: (context, state) {
              final totalQty = state.fold<int>(0, (s, m) => s + m.qty);
              return IconButton(
                icon: Stack(
                  children: [
                    const Icon(Icons.shopping_cart),
                    if (totalQty > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.red,
                          child: Text(
                            '$totalQty',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderSummaryPage()),
                ),
              );
            },
          ),
        ],
      ),
      body: CategoryStackPage(menuList: menuList),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const OrderSummaryPage()),
        ),
        icon: const Icon(Icons.shopping_cart_checkout),
        label: const Text('Ringkasan'),
      ),
    );
  }
}

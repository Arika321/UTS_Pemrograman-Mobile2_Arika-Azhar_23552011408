import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/order_cubit.dart';
import '../models/menu_model.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ringkasan Pesanan")),
      body: BlocBuilder<OrderCubit, List<MenuModel>>(
        builder: (context, orders) {
          final orderCubit = context.read<OrderCubit>();
          final subtotal = orderCubit.getSubtotal();
          final total = orderCubit.getTotalAfterTransactionDiscount();
          final hasDiscount = orderCubit.hasBigDiscount();

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Detail Pesanan:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                Expanded(
                  child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final item = orders[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                          "Qty: ${item.qty}  •  Harga: Rp${item.getDiscountedPrice()}",
                        ),
                        trailing: Text(
                          "Rp${item.getDiscountedPrice() * item.qty}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),

                const Divider(),

                // SUBTOTAL
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal:", style: TextStyle(fontSize: 16)),
                    Text(
                      "Rp$subtotal",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // DISKON TRANSAKSI JIKA ADA
                if (hasDiscount)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Diskon Transaksi 10%:",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                      Text(
                        "-10%",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),

                const SizedBox(height: 10),

                // TOTAL AKHIR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Akhir:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rp$total",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // BUTTON CLEAR ORDER
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<OrderCubit>().clearOrder();
                      Navigator.pop(context);
                    },
                    child: const Text("Selesaikan Transaksi"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

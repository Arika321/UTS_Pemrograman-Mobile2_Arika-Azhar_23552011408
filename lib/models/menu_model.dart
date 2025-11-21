class MenuModel {
  final String id;
  final String name;
  final int price;
  final String category;
  final double discount;
  final int qty;

  MenuModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.discount,
    this.qty = 0,
  });

  /// Menghitung harga setelah diskon per item.
  /// Rumus: price - (price * discount)
  int getDiscountedPrice() {
    return (price - (price * discount)).toInt();
  }

  /// Digunakan untuk mengubah data qty atau field lain
  /// tanpa membuat object baru secara manual.
  MenuModel copyWith({
    String? id,
    String? name,
    int? price,
    String? category,
    double? discount,
    int? qty,
  }) {
    return MenuModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      discount: discount ?? this.discount,
      qty: qty ?? this.qty,
    );
  }
}

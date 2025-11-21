import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/category_cubit.dart';
import '../widgets/menu_card.dart';
import '../models/menu_model.dart';

class CategoryStackPage extends StatelessWidget {
  final List<MenuModel> menuList;

  const CategoryStackPage({super.key, required this.menuList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryCubit(),
      child: BlocBuilder<CategoryCubit, String>(
        builder: (context, selectedCategory) {
          // Filter menu sesuai kategori
          final filteredMenu = menuList
              .where((m) => m.category == selectedCategory)
              .toList();

          return Stack(
            children: [
              // BG kategori
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 120,
                child: Container(
                  color: Colors.blue.shade100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryButton(
                        title: "Makanan",
                        isActive: selectedCategory == "Makanan",
                        onTap: () => context
                            .read<CategoryCubit>()
                            .chooseCategory("Makanan"),
                      ),
                      CategoryButton(
                        title: "Minuman",
                        isActive: selectedCategory == "Minuman",
                        onTap: () => context
                            .read<CategoryCubit>()
                            .chooseCategory("Minuman"),
                      ),
                    ],
                  ),
                ),
              ),

              // List Menu
              Positioned.fill(
                top: 130,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredMenu.length,
                  itemBuilder: (context, index) {
                    return MenuCard(menu: filteredMenu[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.blue : Colors.black,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 4,
              width: 40,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }
}

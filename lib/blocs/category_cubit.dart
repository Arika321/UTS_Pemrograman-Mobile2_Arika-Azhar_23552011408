import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<String> {
  CategoryCubit() : super("Makanan");

  void chooseCategory(String category) {
    emit(category);
  }
}

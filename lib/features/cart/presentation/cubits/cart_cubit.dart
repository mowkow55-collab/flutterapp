import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../books/domain/entities/book_entity.dart';
import '../../domain/entities/cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addToCart(BookEntity book) {
    if (state.items.any((item) => item.book.id == book.id)) {
      // Increment quantity if already exists
      final updatedItems = state.items.map((item) {
        if (item.book.id == book.id) {
          return item.copyWith(quantity: item.quantity + 1);
        }
        return item;
      }).toList();
      emit(CartState(items: updatedItems));
    } else {
      // Add new item
      final updatedItems = List<CartItem>.from(state.items)
        ..add(CartItem(book: book));
      emit(CartState(items: updatedItems));
    }
  }

  void removeFromCart(BookEntity book) {
    final updatedItems = state.items.where((item) => item.book.id != book.id).toList();
    emit(CartState(items: updatedItems));
  }

  void updateQuantity(BookEntity book, int quantity) {
    if (quantity <= 0) {
      removeFromCart(book);
      return;
    }
    final updatedItems = state.items.map((item) {
      if (item.book.id == book.id) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();
    emit(CartState(items: updatedItems));
  }

  void clearCart() {
    emit(const CartState(items: []));
  }
}

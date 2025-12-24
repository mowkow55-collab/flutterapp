import 'package:equatable/equatable.dart';
import '../../../books/domain/entities/book_entity.dart';

class CartItem extends Equatable {
  final BookEntity book;
  final int quantity;

  const CartItem({
    required this.book,
    this.quantity = 1,
  });

  CartItem copyWith({
    BookEntity? book,
    int? quantity,
  }) {
    return CartItem(
      book: book ?? this.book,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => book.price * quantity;

  @override
  List<Object> get props => [book, quantity];
}

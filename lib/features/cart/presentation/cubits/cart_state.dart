part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({this.items = const []});

  double get totalAmount => items.fold(0, (sum, item) => sum + item.totalPrice);
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  @override
  List<Object> get props => [items];
}

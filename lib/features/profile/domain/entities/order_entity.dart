import 'package:equatable/equatable.dart';
import '../../../cart/domain/entities/cart_item.dart';

class OrderEntity extends Equatable {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final DateTime date;
  final String status;

  const OrderEntity({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.date,
    this.status = 'Delivered',
  });

  @override
  List<Object?> get props => [id, items, totalAmount, date, status];
}

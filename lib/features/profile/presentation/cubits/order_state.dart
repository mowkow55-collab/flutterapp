part of 'order_cubit.dart';

class OrderState extends Equatable {
  final List<OrderEntity> orders;

  const OrderState({this.orders = const []});

  @override
  List<Object> get props => [orders];
}

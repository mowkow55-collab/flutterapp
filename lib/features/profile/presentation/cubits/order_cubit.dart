import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/order_entity.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderState());

  void addOrder(OrderEntity order) {
    final updatedOrders = List<OrderEntity>.from(state.orders)..insert(0, order);
    emit(OrderState(orders: updatedOrders));
  }
}

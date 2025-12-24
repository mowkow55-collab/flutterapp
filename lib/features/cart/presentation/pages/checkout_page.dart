import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../cubits/cart_cubit.dart';
import '../../../profile/domain/entities/order_entity.dart';
import '../../../profile/presentation/cubits/order_cubit.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          // If cart becomes empty logic if needed
        },
        builder: (context, state) {
           if (state.items.isEmpty) {
             // In real app maybe redirect or show empty state
             return const Center(child: Text("Cart is empty"));
           }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Order Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return ListTile(
                        leading: const Icon(Icons.book),
                        title: Text(item.book.title),
                        trailing: Text('\$${item.totalPrice.toStringAsFixed(2)}'),
                        subtitle: Text('Qty: ${item.quantity}'),
                      );
                    },
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total to Pay:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      '\$${state.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    final cartState = context.read<CartCubit>().state;
                    
                    // Create Order
                    final order = OrderEntity(
                      id: const Uuid().v4(),
                      items: List.from(cartState.items),
                      totalAmount: cartState.totalAmount,
                      date: DateTime.now(),
                    );
                    
                    // Save Order
                    context.read<OrderCubit>().addOrder(order);
                    
                    // Clear cart
                    context.read<CartCubit>().clearCart();
                    
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Order Placed!'),
                        content: const Text('Thank you for your purchase.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.pop(); // Close dialog
                              context.pushReplacement('/order-details', extra: order);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Confirm Order'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubits/cart_cubit.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final item = state.items[index];
              return Dismissible(
                key: Key(item.book.id),
                direction: DismissDirection.endToStart,
                onDismissed: (_) {
                  context.read<CartCubit>().removeFromCart(item.book);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: Row(
                  children: [
                    // Small Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      // We can use CachedNetworkImage here too, but simple placeholder for now or network image
                      child: Image.network(
                        item.book.imageUrl,
                        width: 60,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            Container(width: 60, height: 90, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.book.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            item.book.author,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '\$${item.book.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            context.read<CartCubit>().updateQuantity(
                                  item.book,
                                  item.quantity - 1,
                                );
                          },
                        ),
                        Text('${item.quantity}'),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () {
                            context.read<CartCubit>().updateQuantity(
                                  item.book,
                                  item.quantity + 1,
                                );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) return const SizedBox.shrink();
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push('/checkout');
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

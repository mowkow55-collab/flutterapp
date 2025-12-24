import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // If needed for Cart
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/book_entity.dart';
import '../../../cart/presentation/cubits/cart_cubit.dart';

class BookDetailPage extends StatelessWidget {
  final BookEntity book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            stretch: true,
            backgroundColor: Theme.of(context).colorScheme.surface,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'book_${book.id}',
                child: CachedNetworkImage(
                  imageUrl: book.imageUrl,
                  fit: BoxFit.cover,
                   placeholder: (context, url) => Container(color: Colors.grey[300]),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border, color: Colors.black),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
              onPressed: () => Navigator.of(context).pop(), // Changed context.pop() to Navigator.of(context).pop() for standard Flutter navigation
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              transform: Matrix4.translationValues(0, -24, 0), // Overlap effect
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               book.genre?.toUpperCase() ?? 'BOOK',
                               style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                 color: Theme.of(context).colorScheme.primary,
                                 letterSpacing: 1.2,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             const SizedBox(height: 8),
                             Text(
                              book.title,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                             ),
                             const SizedBox(height: 4),
                             Text(
                              book.author,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                         decoration: BoxDecoration(
                           color: Theme.of(context).colorScheme.primaryContainer,
                           borderRadius: BorderRadius.circular(12),
                         ),
                         child: Text(
                          '\$${book.price.toStringAsFixed(2)}',
                           style: Theme.of(context).textTheme.titleLarge?.copyWith(
                             color: Theme.of(context).colorScheme.onPrimaryContainer,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatBadge(context, Icons.star, book.rating?.toString() ?? '-', 'Rating'),
                      _buildStatBadge(context, Icons.menu_book, book.pages?.toString() ?? '-', 'Pages'),
                      _buildStatBadge(context, Icons.language, book.language ?? '-', 'Language'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Synopsis',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    book.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6, color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 16),
                  _buildDetailRow(context, 'Publisher', book.publisher ?? 'Unknown'),
                  if (book.publicationDate != null)
                    _buildDetailRow(context, 'Released', 
                        "${book.publicationDate!.year}-${book.publicationDate!.month}-${book.publicationDate!.day}"),
                  
                  const SizedBox(height: 100), // Spacing for bottom button
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
             BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                context.read<CartCubit>().addToCart(book);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              child: const Text('Add to Cart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatBadge(BuildContext context, IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.amber, size: 20),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

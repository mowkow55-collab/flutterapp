import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/book_entity.dart';

class FeaturedBookCard extends StatelessWidget {
  final BookEntity book;
  const FeaturedBookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/book/${book.id}', extra: book),
      child: Container(
        width: 280,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          elevation: 4,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: book.imageUrl,
                  width: 100,
                  height: double.infinity,
                  fit: BoxFit.cover,
                   placeholder: (context, url) => Container(color: Colors.grey[200]),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          book.genre ?? 'Book',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        book.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book.author,
                        maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                       const SizedBox(height: 8),
                       Row(
                         children: [
                           const Icon(Icons.star, size: 16, color: Colors.amber),
                           const SizedBox(width: 4),
                           Text(
                             book.rating?.toString() ?? 'N/A',
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                           ),
                         ],
                       )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

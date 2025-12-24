import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubits/books_cubit.dart';
import '../widgets/book_grid_item.dart';
import '../widgets/featured_book_card.dart';

import '../../domain/entities/book_entity.dart';
import '../../../../features/auth/presentation/cubits/auth_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedGenre = 'All';
  final List<String> genres = ['All', 'Fiction', 'Sci-Fi', 'Biography', 'History', 'Technology'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BooksCubit, BooksState>(
          builder: (context, state) {
            if (state is BooksLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BooksError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is BooksLoaded) {
               if (state.books.isEmpty) {
                return const Center(child: Text('No books available.'));
              }

              final filteredBooks = selectedGenre == 'All' 
                  ? state.books 
                  : state.books.where((book) => book.genre == selectedGenre).toList();
              
              // Simple logic for featured: Top rated > 4.5
              final featuredBooks = state.books.where((b) => (b.rating ?? 0) > 4.5).toList();

              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Good Afternoon,', style: Theme.of(context).textTheme.bodyLarge),
                              Text('Book Lover', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.shopping_bag_outlined),
                                onPressed: () => context.push('/cart'),
                              ),
                              IconButton(
                                icon: const Icon(Icons.settings_outlined),
                                onPressed: () => context.push('/settings'),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () => context.push('/profile'),
                                child: const CircleAvatar(
                                   radius: 20,
                                   backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026024d'), // Placeholder avatar
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ),
                    ),
                  ),
                  if (featuredBooks.isNotEmpty) ...[
                     SliverToBoxAdapter(
                      child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
                         child: Text("Featured", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          itemCount: featuredBooks.length,
                          itemBuilder: (context, index) {
                            return FeaturedBookCard(book: featuredBooks[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                  SliverToBoxAdapter(
                    child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                       child: Text("Library", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: genres.map((genre) {
                          final isSelected = selectedGenre == genre;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ChoiceChip(
                              label: Text(genre),
                              selected: isSelected,
                              selectedColor: Theme.of(context).colorScheme.primaryContainer,
                              labelStyle: TextStyle(
                                color: isSelected ? Theme.of(context).colorScheme.onPrimaryContainer : null,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                              onSelected: (selected) {
                                if (selected) {
                                  setState(() {
                                    selectedGenre = genre;
                                  });
                                }
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  filteredBooks.isEmpty 
                    ? const SliverToBoxAdapter(child: Center(child: Padding(padding: EdgeInsets.all(32), child: Text("No books found"))))
                    : SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverGrid(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return BookGridItem(book: filteredBooks[index]);
                            },
                            childCount: filteredBooks.length,
                          ),
                        ),
                      ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

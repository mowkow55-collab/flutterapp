import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final double price;
  final String? genre;
  final double? rating;
  final int? pages;
  final String? language;
  final String? publisher;
  final DateTime? publicationDate;

  const BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.genre,
    this.rating,
    this.pages,
    this.language,
    this.publisher,
    this.publicationDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        description,
        imageUrl,
        price,
        genre,
        rating,
        pages,
        language,
        publisher,
        publicationDate
      ];
}

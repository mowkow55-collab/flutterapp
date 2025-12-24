import '../../domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  const BookModel({
    required super.id,
    required super.title,
    required super.author,
    required super.description,
    required super.imageUrl,
    required super.price,
    super.genre,
    super.rating,
    super.pages,
    super.language,
    super.publisher,
    super.publicationDate,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      genre: json['genre'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      pages: json['pages'] as int?,
      language: json['language'] as String?,
      publisher: json['publisher'] as String?,
      publicationDate: json['publication_date'] != null
          ? DateTime.tryParse(json['publication_date'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'genre': genre,
      'rating': rating,
      'pages': pages,
      'language': language,
      'publisher': publisher,
      'publication_date': publicationDate?.toIso8601String(),
    };
  }
}

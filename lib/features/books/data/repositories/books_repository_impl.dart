import '../../domain/entities/book_entity.dart';
import '../../domain/repositories/books_repository.dart';
import '../datasources/books_remote_datasource.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksRemoteDataSource remoteDataSource;

  BooksRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<BookEntity>> getBooks() async {
    return await remoteDataSource.getBooks();
  }

  @override
  Future<BookEntity> getBookById(String id) async {
    return await remoteDataSource.getBookById(id);
  }
}

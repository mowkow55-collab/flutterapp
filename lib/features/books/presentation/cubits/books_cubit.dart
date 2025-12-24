import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repositories/books_repository.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final BooksRepository booksRepository;

  BooksCubit({required this.booksRepository}) : super(BooksInitial()) {
    getBooks();
  }

  Future<void> getBooks() async {
    emit(BooksLoading());
    try {
      final books = await booksRepository.getBooks();
      emit(BooksLoaded(books: books));
    } catch (e) {
      emit(BooksError(message: e.toString()));
    }
  }
}
